import os

fp_root = "/home/danny/decomps/pokeyellow/_DAN"

fp_art_orig = os.path.join(fp_root, "ART_ORIG")
fp_art_dest = os.path.join(fp_root, "ART")

for file in os.listdir(fp_art_orig):
    fp_source = os.path.join(fp_art_orig, file)
    pkmn_int = int(file.split(" ")[0])
    fp_target = os.path.join(fp_art_dest, f"ART{pkmn_int}.png")
    # os.rename(fp_source, fp_target)

fp_sprites_orig = os.path.join(fp_root, "SPRITES_ORIG")
fp_sprites_dest = os.path.join(fp_root, "SPRITES")

for file in os.listdir(fp_sprites_orig):
    fp_source = os.path.join(fp_sprites_orig, file)
    pkmn_int = int(file.split(".")[0])
    fp_target = os.path.join(fp_sprites_dest, f"SPRITE{pkmn_int}.png")
    # os.rename(fp_source, fp_target)