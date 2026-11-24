import os
import re
import json

root = "/home/danny/decomps/pokeyellow"

# ---------------------------------------------------------------------
# Pokemon Data
# ---------------------------------------------------------------------

fpath_pkmn_data_json = os.path.join(root, "_DAN/pkmn_data.json")

fpath_pokedex = os.path.join(root, "constants/pokedex_constants.asm")
fpath_pkmn_names = os.path.join(root, "data/pokemon/names.asm")
fpath_pkmn_const = os.path.join(root, "constants/pokemon_constants.asm")
fpath_pkmn_evos_moves = os.path.join(root, "data/pokemon/evos_moves.asm")
dpath_pkmn_data = os.path.join(root, "data/pokemon/base_stats")

pkmn_data = {}

with open(fpath_pokedex, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.strip().split(";")[0]
        if clean_line.startswith("const DEX"):
            name = clean_line.split(" ")[1].split("DEX_")[1]
            pkmn_data[name] = {"key_lookup": name.replace("_", "")}

pkmn_const = []
with open(fpath_pkmn_const, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    for line in lines:
        clean_line = line.strip().split(";")[0]
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
        clean_line = line.strip().split(";")[0]
        if clean_line.startswith("dname"):
            pkmn_names.append(clean_line.split("\"")[1])

for c, n in zip(pkmn_const, pkmn_names):
    if c in pkmn_data.keys():
        pkmn_data[c]["Name"] = n

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
            clean_line = line.strip().split(";")[0]
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
            clean_line = line.strip().split(";")[0]
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

all_problems = []
acceptable_start_move_mismatch = ["CATERPIE", "METAPOD", "WEEDLE", "KAKUNA", "MAGIKARP"]
acceptable_learn_move_mismatch = ["METAPOD", "KAKUNA", "MAGIKARP", "PIKACHU", "EEVEE"]
for key in pkmn_data.keys():
    if len(pkmn_data[key]["TMHM Moves"]) != len(set(pkmn_data[key]["TMHM Moves"])):
        print(f"[DUPLICATE TMHM] {key}")
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
        clean_line = line.strip().split(";")[0]
        if clean_line.startswith("li \""):
            move_name_dict[index] = clean_line.replace("li \"", "").replace("\"", "")
            index += 1

with open(fpath_move_data, "r", encoding="utf-8") as f:
    lines = f.read().split('\n')
    index = 0
    for line in lines:
        clean_line = line.strip().split(";")[0]
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