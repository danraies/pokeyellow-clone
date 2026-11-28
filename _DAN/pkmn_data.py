import os
import re
import json

root = "/home/danny/decomps/pokeyellow"
all_problems = []

# ---------------------------------------------------------------------
# Pokemon Data
# ---------------------------------------------------------------------

fpath_pkmn_data_json = os.path.join(root, "_DAN/pkmn_data.json")

fpath_pokedex = os.path.join(root, "constants/pokedex_constants.asm")
fpath_pkmn_names = os.path.join(root, "data/pokemon/names.asm")
fpath_pkmn_const = os.path.join(root, "constants/pokemon_constants.asm")
fpath_pkmn_evos_moves = os.path.join(root, "data/pokemon/evos_moves.asm")
dpath_pkmn_data = os.path.join(root, "data/pokemon/base_stats")
dpath_encocunters = os.path.join(root, "data/wild/maps")
fpath_probabilities = os.path.join(root, "data/wild/probabilities.asm")
fpath_super_rod = os.path.join(root, "data/wild/super_rod.asm")
fpath_good_rod = os.path.join(root, "data/wild/good_rod.asm")
fpath_gc_prices = os.path.join(root, "data/events/prize_mon_levels.asm")
fpath_trades = os.path.join(root, "data/events/trades.asm")

pkmn_data = {}

### Initializing pkmn dictionary based on the pokedex.
# Note that the "name" pulled from the file is the C name, not the string. So MR_MIME instead of "MR MIME".

with open(fpath_pokedex, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    pokedex_number = 1
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("const DEX"):
            name = clean_line.split(" ")[1].split("DEX_")[1]
            pkmn_data[name] = {
                "key_lookup": name.replace("_", ""),
                "Pokedex Number": pokedex_number,
                "Location": {
                    "Wild": [],
                    "Surf": [],
                    "Old Rod": [],
                    "Good Rod": [],
                    "Super Rod": [],
                    "Gift": [],
                    "Trade": [],
                    "Purchase": [],
                    "Reward": [],
                    "Fossil": [],
                    "Static": []
                },
            }
            pokedex_number += 1

### Getting the name strings for each pkmn.
# fpath_pkmn_names stores the text, but it is in an order that must be compared against fpath_pkmn_const

pkmn_const = []
with open(fpath_pkmn_const, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.split(";")[0].strip()
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
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("dname"):
            pkmn_names.append(clean_line.split("\"")[1])

for c, n in zip(pkmn_const, pkmn_names):
    if c in pkmn_data.keys():
        pkmn_data[c]["Name"] = n

### Getting evolutions and Level-Up moves from the file that holds them.

key_lookup = {pkmn_data[key]["key_lookup"]: key for key in pkmn_data.keys()}
with open(fpath_pkmn_evos_moves, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    ACTIVE = False
    READING_EVOS = True
    for line in lines:
        if line == ";;;; MOVES START ;;;;":
            ACTIVE = True
        if line == ";;;; MOVES STOP ;;;;":
            ACTIVE = False
        if ACTIVE:
            clean_line = line.split(";")[0].strip()
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

### Pulling stats, types, catch rate, base exp, starting moves, and tm/hm moves from individual files.

for file in os.listdir(dpath_pkmn_data):
    this_fpath = os.path.join(dpath_pkmn_data, file)
    with open(this_fpath, "r", encoding="utf-8") as f:
        lines = f.read().split('\n')
        db_count = 0
        READING_TMHM = False
        tmhm_string = None
        for line in lines:
            clean_line = line.split(";")[0].strip()
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
                        pkmn_data[key]["Stats"]["BST"] = pkmn_data[key]["Stats"]["HP"] + pkmn_data[key]["Stats"]["Atk"] + pkmn_data[key]["Stats"]["Def"] + pkmn_data[key]["Stats"]["Spd"] + pkmn_data[key]["Stats"]["Spc"]
                    case 3:
                        types = clean_line.split("db")[1].replace("PSYCHIC_TYPE", "PSYCHIC").split(",")
                        pkmn_data[key]["Types"] = [types[0].strip(), types[1].strip()]
                    case 4:
                        catch_rate = clean_line.split("db")[1].strip().split(" ")[0].strip()
                        pkmn_data[key]["Catch Rate"] = int(catch_rate)
                    case 5:
                        base_exp = clean_line.split("db")[1].strip().split(" ")[0].strip()
                        pkmn_data[key]["Base EXP"] = int(base_exp)
                    case 6:
                        moves = clean_line.split("db")[1].strip().split(",")
                        move_list = []
                        for move in moves:
                            clean_move = move.strip()
                            if clean_move != "NO_MOVE":
                                move_list.append(clean_move)
                        pkmn_data[key]["Starting Moves"] = move_list
            if clean_line.startswith("tmhm"):
                tmhm_string = clean_line.split("tmhm")[1]
            if READING_TMHM:
                tmhm_string = tmhm_string + clean_line
            READING_TMHM = clean_line.endswith("\\")
            if not READING_TMHM and tmhm_string is not None:
                pkmn_data[key]["TMHM Moves"] = [move.strip() for move in tmhm_string.replace("\\", "").split(",")] if tmhm_string != "" else []
                tmhm_string = None

### Populating encounter locations.
# (Location, Level, Probability)

# Wild encounters
wild_probabilities = []
with open(fpath_probabilities, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("wild_chance "):
            wild_probabilities.append(int(clean_line.replace("wild_chance ", "")) * 100 / 256)

all_locations = set()
for file in os.listdir(dpath_encocunters):
    if file == "nothing.asm":
        continue
    this_fpath = os.path.join(dpath_encocunters, file)
    with open(this_fpath, "r", encoding="utf-8") as f:
        lines = f.read().split('\n')
        name_from_fp = file.split('.')[0]
        name_from_text = None
        scanning_grass = False
        scanning_surf = False
        for line in lines:
            clean_line = line.split(";")[0].strip()
            if clean_line.endswith("WildMons:"):
                if name_from_text is not None:
                    all_problems.append(f"This file has two names for some reason: {file}")
                name_from_text = clean_line.replace("WildMons:", "")

            if clean_line.startswith("db"):
                this_data = clean_line.replace("db", "").split(",")
                this_level = int(this_data[0].strip())
                this_pkmn = this_data[1].strip()
                if scanning_grass:
                    pkmn_data[this_pkmn]["Location"]["Wild"].append((name_from_fp, this_level, wild_probabilities[probability_counter]))
                if scanning_surf:
                    pkmn_data[this_pkmn]["Location"]["Surf"].append((name_from_fp, this_level, wild_probabilities[probability_counter]))
                probability_counter += 1

            if clean_line.startswith("def_grass_wildmons"):
                scanning_grass = True
                probability_counter = 0
            if clean_line.startswith("end_grass_wildmons"):
                scanning_grass = False
            if clean_line.startswith("def_water_wildmons"):
                scanning_surf = True
                probability_counter = 0
            if clean_line.startswith("end_water_wildmons"):
                scanning_surf = False
        if name_from_text is None or name_from_fp != name_from_text:
            all_problems.append(f"[LOCATION NAME MISMATCH] {name_from_fp} | {name_from_text}")
        all_locations.add(name_from_fp)

# Fishing
good_rod_pokemon = []
with open(fpath_good_rod, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("db "):
            this_data = clean_line.replace("db", "").split(",")
            this_level = int(this_data[0].strip())
            this_pkmn = this_data[1].strip()
            good_rod_pokemon.append((this_pkmn, this_level))

super_rod_probabilites = [102/256, 76/256, 51/256, 27/256]
with open(fpath_super_rod, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("db ") and not clean_line.startswith("db -1"):
            this_data = clean_line.replace("db ", "").split(",")
            this_loc_raw = this_data[0].strip()
            this_loc = "".join([s.title() for s in this_loc_raw.split("_")])
            p1 = this_data[1].strip()
            l1 = int(this_data[2].strip())
            p2 = this_data[3].strip()
            l2 = int(this_data[4].strip())
            p3 = this_data[5].strip()
            l3 = int(this_data[6].strip())
            p4 = this_data[7].strip()
            l4 = int(this_data[8].strip())
            all_locations.add(this_loc)
            pkmn_data[p1]["Location"]["Super Rod"].append((this_loc, l1, super_rod_probabilites[0]))
            pkmn_data[p2]["Location"]["Super Rod"].append((this_loc, l2, super_rod_probabilites[1]))
            pkmn_data[p3]["Location"]["Super Rod"].append((this_loc, l3, super_rod_probabilites[2]))
            pkmn_data[p4]["Location"]["Super Rod"].append((this_loc, l4, super_rod_probabilites[3]))
            for pkmn_species, pkmn_level in good_rod_pokemon:
                pkmn_data[pkmn_species]["Location"]["Good Rod"].append((this_loc, pkmn_level, 50))
            pkmn_data["MAGIKARP"]["Location"]["Old Rod"].append((this_loc, 5, 100))

# Trades
TRADE_LOCATIONS = [
    "Route11Gate",
    "Route2TradeHouse",
    None,
    "CinnabarIsland",
    None,
    "Route18Gate",
    None,
    "CinnabarIsland",
    "CinnabarIsland",
    "Route5UndergroundPath",
]

with open(fpath_trades, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    counter = 0
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("npctrade"):
            received_pkmn = clean_line.split(",")[1].strip()
            this_loc = TRADE_LOCATIONS[counter]
            if this_loc is not None:
                all_locations.add(this_loc)
                pkmn_data[received_pkmn]["Location"]["Trade"].append((this_loc, -1, 100))
            counter += 1

# Game Corner prizes
with open(fpath_gc_prices, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    counter = 0
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("db "):
            this_data = clean_line.replace("db ", "").split(",")
            this_pkmn = this_data[0].strip()
            this_level = int(this_data[1].strip())
            pkmn_data[this_pkmn]["Location"]["Purchase"].append(("CeladonCity", this_level, 100))

# Manualling adding some that I'm not clever enough to code programmatically.
all_locations.add("SaffronCity")
all_locations.add("Route16Gate")
all_locations.add("Route11Gate")
pkmn_data["PIKACHU"]["Location"]["Gift"].append(("PalletTown", 25, 100))
pkmn_data["EEVEE"]["Location"]["Gift"].append(("CeladonCity", 25, 100))
pkmn_data["LAPRAS"]["Location"]["Gift"].append(("SaffronCity", 15, 100))
pkmn_data["SQUIRTLE"]["Location"]["Gift"].append(("VermilionCity", 10, 100))
pkmn_data["BULBASAUR"]["Location"]["Gift"].append(("CeruleanCity", 10, 100))
pkmn_data["CHARMANDER"]["Location"]["Gift"].append(("Route24", 10, 100))
pkmn_data["MAGIKARP"]["Location"]["Purchase"].append(("Route3", 10, 100))
pkmn_data["HITMONCHAN"]["Location"]["Reward"].append(("SaffronCity", 30, 100))
pkmn_data["HITMONLEE"]["Location"]["Reward"].append(("SaffronCity", 30, 100))
pkmn_data["AERODACTYL"]["Location"]["Fossil"].append(("CinnabarIsland", 30, 100))
pkmn_data["KABUTO"]["Location"]["Fossil"].append(("CinnabarIsland", 30, 100))
pkmn_data["OMANYTE"]["Location"]["Fossil"].append(("CinnabarIsland", 30, 100))
pkmn_data["VOLTORB"]["Location"]["Static"].append(("PowerPlant", 40, 100))
pkmn_data["ELECTRODE"]["Location"]["Static"].append(("PowerPlant", 43, 100))
pkmn_data["SNORLAX"]["Location"]["Static"].append(("Route16Gate", 30, 100))
pkmn_data["SNORLAX"]["Location"]["Static"].append(("Route11Gate", 30, 100))
pkmn_data["ZAPDOS"]["Location"]["Static"].append(("PowerPlant", 50, 100))
pkmn_data["ARTICUNO"]["Location"]["Static"].append(("SeafoamIslandsB4F", 50, 100))
pkmn_data["MOLTRES"]["Location"]["Static"].append(("VictoryRoad2F", 50, 100))
pkmn_data["MEWTWO"]["Location"]["Static"].append(("CeruleanCaveB1F", 70, 100))

for this_pkmn, this_data in pkmn_data.items():
    for this_type, this_type_data in this_data["Location"].items():
        for this_location_data in this_type_data:
            if not this_location_data[0] in all_locations:
                all_problems.append(f"[EXTRA LOCATION] {this_location_data}")

### Compiling the data around the ways you can obtain each pokemon

LOCATION_REPLACEMENTS = {
    "CeruleanCave1F": "CeruleanCave",
    "CeruleanCave2F": "CeruleanCave",
    "CeruleanCaveB1F": "CeruleanCave",
    "MtMoon1F": "MountMoon",
    "MtMoonB1F": "MountMoon",
    "MtMoonB2F": "MountMoon",
    "PokemonMansion1F": "CinnabarIsland",
    "PokemonMansion2F": "CinnabarIsland",
    "PokemonMansion3F": "CinnabarIsland",
    "PokemonMansionB1F": "CinnabarIsland",
    "PokemonTower1F": "LavenderTown",
    "PokemonTower2F": "LavenderTown",
    "PokemonTower3F": "LavenderTown",
    "PokemonTower4F": "LavenderTown",
    "PokemonTower5F": "LavenderTown",
    "PokemonTower6F": "LavenderTown",
    "PokemonTower7F": "LavenderTown",
    "RockTunnel1F": "RockTunnel",
    "RockTunnelB1F": "RockTunnel",
    "SafariZoneCenter": "SafariZone",
    "SafariZoneEast": "SafariZone",
    "SafariZoneNorth": "SafariZone",
    "SafariZoneWest": "SafariZone",
    "SeafoamIslands1F": "SeafoamIsland",
    "SeafoamIslandsB1F": "SeafoamIsland",
    "SeafoamIslandsB2F": "SeafoamIsland",
    "SeafoamIslandsB3F": "SeafoamIsland",
    "SeafoamIslandsB4F": "SeafoamIsland",
    "VictoryRoad1F": "VictoryRoad",
    "VictoryRoad2F": "VictoryRoad",
    "VictoryRoad3F": "VictoryRoad",
}

ENCOUNTER_TYPE_REPLACEMENT = {
    "Wild": "wild",
    "Surf": "surf",
    "Old Rod": "fish",
    "Good Rod": "fish",
    "Super Rod": "fish",
    "Gift": "gift",
    "Trade": "trade",
    "Purchase": "purchase",
    "Reward": "reward",
    "Fossil": "fossil",
    "Static": "static",
}

default_color_keys = {}
for pkmn in pkmn_data.keys():
    availability_tracker = dict()
    for encounter_type, encounter_data in pkmn_data[pkmn]["Location"].items():
        for this_location, _, _ in encounter_data:
            if this_location in LOCATION_REPLACEMENTS.keys():
                latex_location = LOCATION_REPLACEMENTS[this_location]
            else:
                latex_location = this_location
            if not latex_location in default_color_keys.keys():
                default_color_keys[latex_location] = "White"
            if not latex_location in availability_tracker.keys():
                availability_tracker[latex_location] = set()
            availability_tracker[latex_location].add(ENCOUNTER_TYPE_REPLACEMENT[encounter_type])
    pkmn_data[pkmn]["Map Color Data"] = {}
    for latex_location, encounter_types in availability_tracker.items():
        if len(encounter_types) == 1:
            this_color_text = list(encounter_types)[0]
            this_color_key = f"color{this_color_text}"
        elif len(encounter_types) == 2:
            this_color_text = " and ".join(encounter_types)
            this_color_key = "!50!".join([f"color{s}" for s in encounter_types])
        else:
            all_problems.append("[TOO MANY ENCOUNTER TYPES] {pkmn} : {encounter_types}")
        pkmn_data[pkmn]["Map Color Data"][latex_location] = [this_color_key, this_color_text]
    # pkmn_data[pkmn]["Map Color Data"] = this_pkmn_color_keys



### Performing some checks against the data that was collected.
acceptable_start_move_mismatch = ["CATERPIE", "METAPOD", "WEEDLE", "KAKUNA", "MAGIKARP"]
acceptable_learn_move_mismatch = ["METAPOD", "KAKUNA", "MAGIKARP", "PIKACHU", "EEVEE"]
for key in pkmn_data.keys():
    if len(pkmn_data[key]["TMHM Moves"]) != len(set(pkmn_data[key]["TMHM Moves"])):
        print(f"[DUPLICATE TMHM] {key}")

    for start_move in pkmn_data[key]["Starting Moves"]:
        if start_move in pkmn_data[key]["Level-Up Moves"]:
            all_problems.append(f"[START MOVE BY LEVEL] {key}")

    evos = [this_evo[2] for this_evo in pkmn_data[key]["Evolutions"]]
    level_moves = [move_data[1] for move_data in pkmn_data[key]["Level-Up Moves"]]
    for evo in evos:
        start_move_mismatch = False
        for start_move in pkmn_data[key]["Starting Moves"]:
            if not start_move in pkmn_data[evo]["Starting Moves"]:
                start_move_mismatch = True
        for start_move in pkmn_data[evo]["Starting Moves"]:
            if not start_move in pkmn_data[key]["Starting Moves"]:
                start_move_mismatch = True
        if start_move_mismatch and not key in acceptable_start_move_mismatch:
            all_problems.append(f"[START MOVE MISMATCH] {key} -> {evo}")

        learn_move_mismatch = False
        evo_level_moves = [move_data[1] for move_data in pkmn_data[evo]["Level-Up Moves"]]
        for level_move in level_moves:
            if not level_move in evo_level_moves:
                learn_move_mismatch = True
        if learn_move_mismatch and not key in acceptable_learn_move_mismatch:
            all_problems.append(f"[LEARN MOVE MISMATCH] {key} -> {evo}")

        missing_evo_tmhm = []
        for tmhm in pkmn_data[key]["TMHM Moves"]:
            if not tmhm in pkmn_data[evo]["TMHM Moves"]:
                missing_evo_tmhm.append(tmhm)
        if len(missing_evo_tmhm) > 0:
            all_problems.append(f"[MISSING EVO TMHM] {key} -> {evo}: {', '.join(missing_evo_tmhm)}")

if len(all_problems) > 0:
    print('\n'.join(all_problems))
else:
    print("NO PKMN PROBLEMS FOUND!")

for key in pkmn_data.keys():
    pkmn_data[key].pop("key_lookup")

if os.path.exists(fpath_pkmn_data_json):
    os.remove(fpath_pkmn_data_json)
with open(fpath_pkmn_data_json, 'w', encoding="utf-8") as f:
    f.write(json.dumps(pkmn_data, indent=4))

# ---------------------------------------------------------------------
# Move Data
# ---------------------------------------------------------------------

fpath_move_data_json = os.path.join(root, "_DAN/move_data.json")

fpath_move_names = os.path.join(root, "data/moves/names.asm")
fpath_move_data = os.path.join(root, "data/moves/moves.asm")

move_data = {}

MOVE_EFFECT_REPLACEMENT = {
    "ACCURACY_DOWN1_EFFECT":        "Drops the target's accuracy by one stage.",
    "ATTACK_DOWN1_EFFECT":          "Drops the target's attack by one stage.",
    "ATTACK_DOWN_SIDE_EFFECT":      "33% chance to drop the target's attack by one stage.",
    "ATTACK_TWICE_EFFECT":          "Attacks twice.",
    "ATTACK_UP1_EFFECT":            "Increases the user's attack by one stage.",
    "ATTACK_UP2_EFFECT":            "Increases the user's attack by two stages.",
    "BIDE_EFFECT":                  "Returns double the damage taken to the target.",
    "BURN_SIDE_EFFECT1":            "10% chance to burn the target.",
    "BURN_SIDE_EFFECT2":            "30% chance to burn the target.",
    "CHARGE_EFFECT":                "Charges on this turn and attacks next turn.",
    "CONFUSION_EFFECT":             "Confuses the target.",
    "CONFUSION_SIDE_EFFECT":        "10% chance to confuse the target.",
    "CONVERSION_EFFECT":            "The user copies the target's type.",
    "DEFENSE_DOWN1_EFFECT":         "Drops the target's defense by one stage.",
    "DEFENSE_DOWN2_EFFECT":         "Drops the target's defense by two stages.",
    "DEFENSE_DOWN_SIDE_EFFECT":     "33% chance to drop the target's attack by one stage.",
    "DEFENSE_UP1_EFFECT":           "Increases the user's defense by one stage.",
    "DEFENSE_UP2_EFFECT":           "Increases the user's defense by two stages.",
    "DISABLE_EFFECT":               "Disables one of the target's moves.",
    "DRAIN_HP_EFFECT":              "Heals the user by 50% of the damage dealt.",
    "DREAM_EATER_EFFECT":           "Heals the user and fails if the target is not asleep.",
    "EVASION_UP1_EFFECT":           "Increases the user's evaison by one stage.",
    "EXPLODE_EFFECT":               "The user faints after damaging the target.",
    "FLINCH_SIDE_EFFECT1":          "10% chance to cause the target to flinch.",
    "FLINCH_SIDE_EFFECT2":          "30% chance to cause the target to flinch.",
    "FLY_EFFECT":                   "Flies in the air on this turn and attacks next turn.",
    "FREEZE_SIDE_EFFECT1":          "10% chance to freeze the target.",
    "HAZE_EFFECT":                  "Resets stat stages of all pokemon.",
    "HEAL_EFFECT":                  "Restores 50% of the user's HP.",
    "HYPER_BEAM_EFFECT":            "The user must recharge on the next turn.",
    "JUMP_KICK_EFFECT":             "If this attack misses, the user damages itself.",
    "LEECH_SEED_EFFECT":            "Drains a bit of the target's HP each turn.",
    "LIGHT_SCREEN_EFFECT":          "Reduces damage from special attacks.",
    "METRONOME_EFFECT":             "The user uses any random move.",
    "MIMIC_EFFECT":                 "The user copies one of the target's moves.",
    "MIRROR_MOVE_EFFECT":           "The user copies the last move that the target used.",
    "MIST_EFFECT":                  "Prevents the target from dropping the user's stats.",
    "NO_ADDITIONAL_EFFECT":         "No additional effect.",
    "OHKO_EFFECT":                  "Causes the target to faint.",
    "PARALYZE_EFFECT":              "Paralyzes the target.",
    "PARALYZE_SIDE_EFFECT1":        "10% chance to paralyze the target.",
    "PARALYZE_SIDE_EFFECT2":        "30% chance to paralyze the target.",
    "PAY_DAY_EFFECT":               "Scatters coins that get collected after the battle.",
    "POISON_EFFECT":                "Poisons the target.",
    "POISON_SIDE_EFFECT1":          "20% chance to poison the target.",
    "POISON_SIDE_EFFECT2":          "40% chance to poison the target.",
    "RAGE_EFFECT":                  "Attack is increased when the user is damaged.",
    "RECOIL_EFFECT":                "Causes recoil, damaging the user.",
    "REFLECT_EFFECT":               "Reduces damage from physical attacks.",
    "SLEEP_EFFECT":                 "Puts the target to sleep.",
    "SPECIAL_DAMAGE_EFFECT":        "",
    "SPECIAL_DOWN_SIDE_EFFECT":     "33% chance to drop the target's special by one stage.",
    "SPECIAL_UP1_EFFECT":           "Increases the user's special by one stage.",
    "SPECIAL_UP2_EFFECT":           "Increases the user's special by two stages.",
    "SPEED_DOWN1_EFFECT":           "Drops the target's speed by one stage.",
    "SPEED_DOWN_SIDE_EFFECT":       "33% chance to drop the target's speed by one stage.",
    "SPEED_UP2_EFFECT":             "Increases the user's speed by two stages.",
    "SPLASH_EFFECT":                "Has no effect.",
    "SUBSTITUTE_EFFECT":            "Creates a substitute at the cost of 25% max HP.",
    "SUPER_FANG_EFFECT":            "Halves the target's current HP.",
    "SWIFT_EFFECT":                 "Guaranteed to hit.",
    "SWITCH_AND_TELEPORT_EFFECT":   "Causes a wild battle to end.",
    "THRASH_PETAL_DANCE_EFFECT":    "Attacks for 3-4 turns and then confuses the user.",
    "TRANSFORM_EFFECT":             "Transforms the user into the target.",
    "TRAPPING_EFFECT":              "Prevents the target from acting until the effect ends.",
    "TWINEEDLE_EFFECT":             "Hits twice and has a 33% chance to poison the target.",
    "TWO_TO_FIVE_ATTACKS_EFFECT":   "Hits 2-5 times.",
}

MOVE_EFFECT_REPLACEMENT_EXCEPTIONS = {
    "TOXIC": "Badly poisons the target.",
    "SONICBOOM": "Deals 20 damage.",
    "SEISMIC_TOSS": "Deals damage equal to the user's level.",
    "NIGHT_SHADE": "Deals damage equal to the user's level.",
    "DRAGON_RAGE": "Deals 40 damage.",
    "PSYWAVE": "Deals a random amount of damage, up to 150% of the user's level.",
    "QUICK_ATTACK": "Usually moves first.",
    "HAYMAKER": "Increased critical hit ratio.",
    "RAZOR_LEAF": "Increased critical hit ratio.",
    "CRABHAMMER": "Increased critical hit ratio.",
    "SLASH": "Increased critical hit ratio.",
}

move_name_dict = {}
with open(fpath_move_names, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    index = 0
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("li \""):
            move_name_dict[index] = clean_line.replace("li \"", "").replace("\"", "")
            index += 1

with open(fpath_move_data, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    index = 0
    for line in lines:
        clean_line = line.split(";")[0].strip()
        if clean_line.startswith("move "):
            this_move_data = clean_line.replace("move ", "").split(",")
            move_key = this_move_data[0].strip()
            move_data[move_key] = {}
            effect_key = this_move_data[1].strip()
            if move_key in MOVE_EFFECT_REPLACEMENT_EXCEPTIONS.keys():
                move_data[move_key]["Effect"] = MOVE_EFFECT_REPLACEMENT_EXCEPTIONS[move_key]
            else:
                move_data[move_key]["Effect"] = MOVE_EFFECT_REPLACEMENT[effect_key]
            move_data[move_key]["Power"] = int(this_move_data[2].strip())
            move_data[move_key]["Type"] = this_move_data[3].strip().replace("PSYCHIC_TYPE", "PSYCHIC")
            move_data[move_key]["Accuracy"] = int(this_move_data[4].strip())
            move_data[move_key]["PP"] = int(this_move_data[5].strip())
            move_data[move_key]["Name"] = move_name_dict[index]
            index += 1

# print(json.dumps(move_data, indent=2))

if os.path.exists(fpath_move_data_json):
    os.remove(fpath_move_data_json)
with open(fpath_move_data_json, 'w', encoding="utf-8") as f:
    f.write(json.dumps(move_data, indent=4))