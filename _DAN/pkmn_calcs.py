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

### Compiling data for the pokedex entries

default_location_colors = {}
for pkmn in pkmn_data.keys():
    for loc in pkmn_data[pkmn]["Map Color Data"].keys():
        if not loc in default_location_colors.keys():
            default_location_colors[loc] = "White"

def create_learnset_string(count, level, type, name):
    return f"{count}/{level}/{type.lower()}/{name.lower()}"
def create_color_command(loc, color):
    return f"\\colorlet{{color{loc}}}{{{color}}}"

pokedex_entry_data = {}
for pkmn, this_data in pkmn_data.items():
    pokedex_entry_data[pkmn] = {"NUM": this_data["Pokedex Number"]}
    learnset_strings = []
    count = 1
    for move in this_data["Starting Moves"]:
        learnset_strings.append(create_learnset_string(count, "--", move_data[move]['Type'], move_data[move]['Name']))
        count += 1
    for level, move in this_data["Level-Up Moves"]:
        learnset_strings.append(create_learnset_string(count, level, move_data[move]['Type'], move_data[move]['Name']))
        count += 1
    if len(learnset_strings) > 0:
        pokedex_entry_data[pkmn]["Learnset Image"] = "\\learnsetimage{{" + ", ".join(learnset_strings) + "}}"
    else:
        pokedex_entry_data[pkmn]["Learnset Image"] = None
        print(f"[LEARNS NO MOVES] {pkmn}")
    pokedex_entry_data[pkmn]["Sprite Command"] = "\\includegraphics{SPRITE" + str(this_data["Pokedex Number"]) + ".png}"
    pokedex_entry_data[pkmn]["Art Command"] = "\\includegraphics[width=0.25\\linewidth]{ART" + str(this_data["Pokedex Number"]) + ".png}"
    this_pkmn_stats = [this_data["Stats"]["HP"], this_data["Stats"]["Atk"], this_data["Stats"]["Def"], this_data["Stats"]["Spd"], this_data["Stats"]["Spc"], this_data["Stats"]["BST"]]
    this_pkmn_stat_strings = [str(s) for s in this_pkmn_stats]
    pokedex_entry_data[pkmn]["Stat Image"] = "\\statimage{" + '}{'.join(this_pkmn_stat_strings) + "}"
    this_location_colors = default_location_colors.copy()
    key_data = set()
    key_data_counter = 0
    found_colors = set()
    if len(this_data["Map Color Data"]) == 0:
        pokedex_entry_data[pkmn]["Map Data"] = "\\unavailablemap{0.5}"
        continue
    for loc, color_data in this_data["Map Color Data"].items():
        color = color_data[0]
        text = color_data[1]
        this_location_colors[loc] = color
        if color != "White" and not color in found_colors:
            key_data.add(f"{key_data_counter}/{color}/{text}")
            found_colors.add(color)
            key_data_counter += 1
    color_lines = []
    for loc, color in this_location_colors.items():
        color_lines.append(create_color_command(loc, color))
    # pokedex_entry_data[pkmn]["Location Colors"] = "\n".join(color_lines)
    # pokedex_entry_data[pkmn]["Location Key"] = ",".join(list(this_location_colors))
    pokedex_entry_data[pkmn]["Map Data"] = '\n'.join([
        "\n".join(color_lines),
        # f"\\keydata{{{{{','.join(list(key_data))}}}}}",
        f"\\drawmap{{1}}{{{{{', '.join(list(key_data))}}}}}",
    ])

pokedex_entry_data_sorted = dict(sorted(pokedex_entry_data.items(), key=lambda item: item[1]["NUM"]))

list_of_latex_lines = []
for pkmn, this_data in pokedex_entry_data_sorted.items():
    list_of_latex_lines.append(this_data["Sprite Command"])
    list_of_latex_lines.append("")
    list_of_latex_lines.append("\\bigskip")
    list_of_latex_lines.append("")
    list_of_latex_lines.append(this_data["Art Command"])
    list_of_latex_lines.append("")
    list_of_latex_lines.append("\\bigskip")
    list_of_latex_lines.append("")
    list_of_latex_lines.append(this_data["Stat Image"])
    list_of_latex_lines.append("")
    list_of_latex_lines.append("\\bigskip")
    list_of_latex_lines.append("")
    list_of_latex_lines.append(this_data["Map Data"])
    list_of_latex_lines.append("")
    list_of_latex_lines.append("\\bigskip")
    list_of_latex_lines.append("")
    # list_of_latex_lines.append(this_data["Learnset Image"])
    list_of_latex_lines.append("")
    list_of_latex_lines.append("\\clearpage")
    list_of_latex_lines.append("")
    
fpath_pkmn_data_json = os.path.join(root, "_DAN/pokedex_test.tex")
if os.path.exists(fpath_pkmn_data_json):
    os.remove(fpath_pkmn_data_json)
with open(fpath_pkmn_data_json, 'w', encoding="utf-8") as f:
    f.write("\n".join(list_of_latex_lines))