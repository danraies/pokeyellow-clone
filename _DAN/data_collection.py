import os
import re
import json

root = "/home/danny/decomps/pokeyellow"
fpath_pkmn_data_json = os.path.join(root, "_DAN/pkmn_data.json")

fpath_pokedex = os.path.join(root, "constants/pokedex_constants.asm") # pokedex orders
fpath_pkmn_names = os.path.join(root, "data/pokemon/names.asm") # name strings
fpath_pkmn_const = os.path.join(root, "constants/pokemon_constants.asm") # species constants
fpath_moves = os.path.join(root, "data/pokemon/evos_moves.asm") # moves
dpath_pkmn_data = os.path.join(root, "data/pokemon/base_stats") # type, stats, starting moves, TMS

pkmn_data = {}
with open(fpath_pokedex, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.strip()
        if clean_line.startswith("const DEX"):
            name = clean_line.split(" ")[1].split("DEX_")[1]
            pkmn_data[name] = {"key_lookup": name.replace("_", "")}

pkmn_const = []
with open(fpath_pkmn_const, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.strip()
        if clean_line.startswith("const"):
            if clean_line.startswith("const_def"):
                pass
            elif clean_line.startswith("const_skip"):
                pkmn_const.append("")
            else:
                name = clean_line.split(" ")[1]
                if name != "NO_MON":
                    pkmn_const.append(name)

pkmn_names = []
with open(fpath_pkmn_names, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.strip()
        if clean_line.startswith("dname"):
            pkmn_names.append(clean_line.split("\"")[1])

for c, n in zip(pkmn_const, pkmn_names):
    if c in pkmn_data.keys():
        pkmn_data[c]["Name"] = n

key_lookup = {pkmn_data[key]["key_lookup"]: key for key in pkmn_data.keys()}
with open(fpath_moves, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    ACTIVE = False
    READING_EVOS = True
    for line in lines:
        if line == ";;;; MOVES START ;;;;":
            ACTIVE = True
        if line == ";;;; MOVES STOP ;;;;":
            ACTIVE = False
        if ACTIVE:
            clean_line = line.strip()
            if not clean_line.startswith(';') and not clean_line == "":
                if not clean_line.startswith("db "):
                    key = key_lookup[clean_line.split("EvosMoves:")[0].upper()]
                    pkmn_data[key]["Level-Up Moves"] = []
                    pkmn_data[key]["Evolutions"] = [] 
                else:
                    if clean_line == "db 0":
                        READING_EVOS = not READING_EVOS
                    elif READING_EVOS:
                        evolution_data = clean_line.split(",")
                        if evolution_data[0] == "db EVOLVE_LEVEL":
                            pkmn_data[key]["Evolutions"].append(["LEVEL", int(evolution_data[1].strip()), evolution_data[2].strip()])
                        elif evolution_data[0] == "db EVOLVE_ITEM":
                            pkmn_data[key]["Evolutions"].append(["STONE", evolution_data[1].strip(), evolution_data[3].strip()])
                    else:
                        move_data = clean_line.split("db ")[1].split(",")
                        pkmn_data[key]["Level-Up Moves"].append([int(move_data[0]), move_data[1].strip()])

for file in os.listdir(dpath_pkmn_data):
    this_fpath = os.path.join(dpath_pkmn_data, file)
    with open(this_fpath, "r", encoding="utf-8") as f:
        lines = f.read().split('\n')
        db_count = 0
        READING_TMHM = False
        tmhm_string = None
        for line in lines:
            clean_line = line.strip()
            if clean_line.startswith("db "):
                db_count += 1
                match db_count:
                    case 1:
                        key = clean_line.split(" ")[1].split("DEX_")[1]
                    case 2:
                        stats = clean_line.split("db")[1].split(",")
                        pkmn_data[key]["Stats"] = {}
                        pkmn_data[key]["Stats"]["HP"] = int(stats[0].strip())
                        pkmn_data[key]["Stats"]["Atk"] = int(stats[1].strip())
                        pkmn_data[key]["Stats"]["Def"] = int(stats[2].strip())
                        pkmn_data[key]["Stats"]["Spd"] = int(stats[3].strip())
                        pkmn_data[key]["Stats"]["Spc"] = int(stats[4].strip())
                    case 3:
                        types = clean_line.split("db")[1].split(";")[0].replace("PSYCHIC_TYPE", "PSYCHIC").split(",")
                        pkmn_data[key]["Types"] = [types[0].strip(), types[1].strip()]
                    case 4:
                        catch_rate = clean_line.split("db")[1].strip().split(" ")[0].strip()
                        pkmn_data[key]["Catch Rate"] = int(catch_rate)
                    case 5:
                        base_exp = clean_line.split("db")[1].strip().split(" ")[0].strip()
                        pkmn_data[key]["Base EXP"] = int(base_exp)
                    case 6:
                        moves = clean_line.split("db")[1].strip().split(";")[0].split(",")
                        move_list = []
                        for move in moves:
                            clean_move = move.strip()
                            if clean_move != "NO_MOVE":
                                move_list.append(clean_move)
                        pkmn_data[key]["Starting Moves"] = move_list
            if clean_line.startswith("tmhm "):
                tmhm_string = clean_line.split("tmhm")[1]
            if READING_TMHM:
                tmhm_string = tmhm_string + clean_line
            READING_TMHM = clean_line.endswith("\\")
            if not READING_TMHM and tmhm_string is not None:
                pkmn_data[key]["TMHM Moves"] = [move.strip() for move in tmhm_string.replace("\\", "").split(",")]


for key in pkmn_data.keys():
    pkmn_data[key].pop("key_lookup")

if os.path.exists(fpath_pkmn_data_json):
    os.remove(fpath_pkmn_data_json)
with open(fpath_pkmn_data_json, 'w', encoding="utf-8") as f:
    f.write(json.dumps(pkmn_data, indent=4))