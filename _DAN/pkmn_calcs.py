import os
import json
from sklearn.neighbors import KernelDensity
import numpy as np

root = "/home/danny/decomps/pokeyellow"

fpath_pkmn_data_json = os.path.join(root, "_DAN/pkmn_data.json")
with open(fpath_pkmn_data_json, "r", encoding="utf-8") as f:
    pkmn_data = json.load(f)

fpath_move_data_json = os.path.join(root, "_DAN/move_data.json")
with open(fpath_move_data_json, "r", encoding="utf-8") as f:
    move_data = json.load(f)

pkmn_stat_info = {key: {"all": [], "max": 0, "min": 256} for key in ["HP", "Atk", "Def", "Spd", "Spc", "BST"]}
pkmn_stat_info["HP"]["Expected Tables"] = 2
pkmn_stat_info["Atk"]["Expected Tables"] = 1
pkmn_stat_info["Def"]["Expected Tables"] = 1
pkmn_stat_info["Spd"]["Expected Tables"] = 1
pkmn_stat_info["Spc"]["Expected Tables"] = 1
pkmn_stat_info["BST"]["Expected Tables"] = 2

N = 150
sample_x = [x * 250 / N for x in range(0, N + 1)]
MAX_MAX_Y = 0
for stat in pkmn_stat_info.keys():
    if stat == "BST":
        MAX_STAT = 590
        BANDWIDTH = 10
    else:
        MAX_STAT = 180
        BANDWIDTH = 7
    sample_x = [x * MAX_STAT / N for x in range(0, N + 1)]
    for pkmn in pkmn_data.keys():
        this_stat = int(pkmn_data[pkmn]["Stats"][stat])
        pkmn_stat_info[stat]["all"].append(this_stat)
        pkmn_stat_info[stat]["max"] = max(pkmn_stat_info[stat]["max"], this_stat)
        pkmn_stat_info[stat]["min"] = min(pkmn_stat_info[stat]["min"], this_stat)
    kde_array = np.array([[x] for x in pkmn_stat_info[stat]['all']])
    kde = KernelDensity(kernel='gaussian', bandwidth=BANDWIDTH).fit(kde_array)
    pdf_y = np.exp(kde.score_samples([[x] for x in sample_x]))
    MAX_MAX_Y = max(max(pdf_y), MAX_MAX_Y)
    pdf_x = [round(x / MAX_STAT, 5) for x in sample_x]
    pkmn_stat_info[stat]["pdf"] = [[x, y] for x, y in zip(pdf_x, pdf_y)]

y_shift = 0.025
for stat in pkmn_stat_info.keys():
    file_name = f"pdf_{stat}.table"
    if os.path.exists(file_name):
        os.remove(file_name)
    data_list = [(0, 0)]
    if stat == "BST":
        divisor = 1.1 * max([y for _, y in pkmn_stat_info[stat]["pdf"]])
    else:
        divisor = MAX_MAX_Y
    for this_x, this_y_raw in pkmn_stat_info[stat]["pdf"]:
        this_y = this_y_raw / divisor
        this_y = this_y if this_y >= 0.001 else 0
        this_y = round((1 - y_shift) * 0.95 * this_y, 5) + y_shift
        data_list.append((this_x, this_y))
    data_list.append((1, 0))
    with open(file_name, 'w', encoding="utf-8") as f:
        f.write('\n'.join([f"{x} {y}" for x, y in data_list]))

def create_learnset_string(count, level, type, name):
    return f"{count}/{level}/{type.lower()}/{name.lower()}"

all_learnset_data = {}
for pkmn, this_data in pkmn_data.items():
    learnset_strings = []
    count = 1
    for move in this_data["Starting Moves"]:
        learnset_strings.append(create_learnset_string(count, "--", move_data[move]['Type'], move_data[move]['Name']))
        count += 1
    for level, move in this_data["Level-Up Moves"]:
        learnset_strings.append(create_learnset_string(count, level, move_data[move]['Type'], move_data[move]['Name']))
        count += 1
    if len(learnset_strings) > 0:
        all_learnset_data[pkmn] = "{" + ", ".join(learnset_strings) + "}"
    else:
        all_learnset_data[pkmn] = None
        print(f"[LEARNS NO MOVES] {pkmn}")

print(f"\\def\\list{all_learnset_data['BULBASAUR']}")

types = {move_data[move]['Type'].lower() for move in move_data.keys()}
count = 1
fake_list = []
for type in types:
    fake_list.append(create_learnset_string(count, 5 * count, type, f"{type} move"))
    count += 1
print("{" + ', '.join(fake_list) + "}")