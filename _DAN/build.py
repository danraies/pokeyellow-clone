import os
import json

root = "/home/danny/decomps/pokeyellow"
fpath_pkmn_data_json = os.path.join(root, "_DAN/pkmn_data.json")

with open(fpath_pkmn_data_json, "r", encoding="utf-8") as f:
    data = json.load(f)

print(data)