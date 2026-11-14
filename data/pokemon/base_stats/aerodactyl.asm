	db DEX_AERODACTYL ; pokedex id

	db  80, 105,  65, 130,  60
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBack

	db SCRATCH, WING_ATTACK, AGILITY, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         DRAGON_CLAW,  MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        SKY_ATTACK,   \
	     REST,         SUBSTITUTE,   FLY,          FLAMETHROWER, ROCK_SLIDE
	; end

	db 0 ; padding
