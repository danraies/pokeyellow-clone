	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 255 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBack

	db TAIL_WHIP, QUICK_ATTACK, EMBER, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE,   FLAMETHROWER, PSYCHIC_M,    TRI_ATTACK,   SHADOW_BALL,  \
		 MEGA_DRAIN,   RAZOR_WIND
	; end

	db 0 ; padding
