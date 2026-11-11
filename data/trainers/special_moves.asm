; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0

SpecialTrainerMoves:
	db BUG_CATCHER, 15
	; metapod
	db 2, 2, TACKLE
	db 2, 3, STRING_SHOT
	db 0

;	db YOUNGSTER, 14
;	db 1, 4, FISSURE
;	db 0

	db BROCK, 1
	; geodude (fine as-is)
	; onix
	db 2, 1, TACKLE
	db 2, 2, SCREECH
	db 2, 3, BIND
	db 2, 4, BIDE
	db 0

	db MISTY, 1
	; staryu (fine as-is)
	; starmie
	db 2, 1, BUBBLEBEAM
	db 2, 2, SWIFT
	db 2, 3, HARDEN
	db 2, 4, WATER_GUN
	db 0

	db LT_SURGE, 1
	; raichu
	db 1, 1, THUNDERBOLT
	db 1, 2, LOW_KICK
	db 1, 3, BODY_SLAM
	db 1, 4, GROWL
	db 0

	db ERIKA, 1
	; tangela
	db 1, 1, CONSTRICT
	db 1, 2, MEGA_DRAIN
	db 1, 3, BIND
	db 1, 4, TOXIC
	; weepinbell
	db 2, 1, STUN_SPORE
	db 2, 2, WRAP
	db 2, 3, SLUDGE
	db 2, 4, RAZOR_LEAF
	; gloom
	db 2, 1, LEECH_SEED
	db 2, 2, SLEEP_POWDER
	db 2, 3, SLUDGE
	db 2, 4, PETAL_DANCE
	db 0

	db KOGA, 1
	; arbok
	db 1, 1, TOXIC
	db 1, 2, SLUDGE
	db 1, 3, LEECH_LIFE
	db 1, 4, HYPER_FANG
	; weezing
	db 2, 1, TOXIC
	db 2, 2, LEECH_SEED
	db 2, 3, SLUDGE
	db 2, 4, SKULL_BASH
	; haunter
	db 3, 1, TOXIC
	db 3, 2, SHADOW_BALL
	db 3, 3, CONFUSE_RAY
	db 3, 4, NIGHT_SHADE
	; venomoth
	db 4, 1, LEECH_LIFE
	db 4, 2, DOUBLE_TEAM
	db 4, 3, PSYCHIC_M
	db 4, 4, TOXIC
	db 0

	db BLAINE, 1
	; ninetales
	db 1, 1, FLAMETHROWER
	db 1, 2, QUICK_ATTACK
	db 1, 3, ROAR
	db 1, 4, CONFUSE_RAY
	; rapidash
	db 1, 4, LICK
	db 2, 1, FLAMETHROWER
	db 3, 2, FIRE_SPIN
	db 4, 3, STOMP
	; arcanine
	db 3, 1, BODY_SLAM
	db 3, 2, FIRE_BLAST
	db 3, 3, DIG
	db 3, 4, AGILITY
	db 0

	db SABRINA, 1
	; abra
	db 1, 1, KINESIS
	db 1, 2, PSYCHIC_M
	db 1, 3, REFLECT
	db 1, 4, THUNDER_WAVE
	; kadabra
	db 2, 1, RECOVER
	db 2, 2, PSYCHIC_M
	db 2, 3, THUNDER_WAVE
	db 2, 4, PSYWAVE
	; alakazam
	db 3, 1, RECOVER
	db 3, 2, PSYCHIC_M
	db 3, 3, SEISMIC_TOSS
	db 3, 4, REFLECT
	db 0

	db GIOVANNI, 3
	; dugtrio
	db 1, 1, FISSURE
	db 1, 2, EARTHQUAKE
	db 1, 3, SAND_ATTACK
	db 1, 4, SLASH
	; persian
	db 2, 1, SLASH
	db 2, 2, DIG
	db 2, 3, SCREECH
	db 2, 4, DOUBLE_TEAM
	; nidoqueen
	db 3, 1, EARTHQUAKE
	db 3, 2, SLUDGE
	db 3, 3, THUNDER
	db 3, 4, THRASH
	; nidoking
	db 4, 1, EARTHQUAKE
	db 4, 2, LEER
	db 4, 3, THUNDER
	db 4, 4, BODY_SLAM
	; rhydon
	db 5, 1, ROCK_SLIDE
	db 5, 2, HORN_DRILL
	db 5, 3, DOUBLE_EDGE
	db 5, 4, EARTHQUAKE
	db 0

	db LORELEI, 1
	; dewgong
	db 1, 1, BUBBLEBEAM
	db 1, 2, ICE_BEAM
	db 1, 3, REST
	db 1, 4, DEFENSE_CURL
	; cloyster
	db 2, 1, ICE_BEAM
	db 2, 2, SPIKE_CANNON
	db 2, 3, CLAMP
	db 2, 4, SUPERSONIC
	; slowbro
	db 3, 1, PSYCHIC_M
	db 3, 2, SURF
	db 3, 3, AMNESIA
	db 3, 4, ICE_BEAM
	; jynx
	db 4, 1, PSYCHIC_M
	db 4, 2, BLIZZARD
	db 4, 3, LICK
	db 4, 4, LOVELY_KISS
	; lapras
	db 5, 1, BLIZZARD
	db 5, 2, HYDRO_PUMP
	db 5, 3, BODY_SLAM
	db 5, 4, SING
	db 0

	db BRUNO, 1
	; tauros
	db 1, 1, ROAR
	db 1, 2, STOMP
	db 1, 3, EARTHQUAKE
	db 1, 4, DOUBLE_KICK
	; hitmonchan
	db 2, 1, STRENGTH
	db 2, 2, ICE_PUNCH
	db 2, 3, THUNDERPUNCH
	db 2, 4, MEDITATE
	; hitmonlee
	db 3, 1, AGILITY
	db 3, 2, SKULL_BASH
	db 3, 3, HI_JUMP_KICK
	db 3, 4, DOUBLE_TEAM
	; pinsir
	db 4, 1, LEECH_LIFE
	db 4, 2, SWORDS_DANCE
	db 4, 3, SUBMISSION
	db 4, 4, BIND
	; machamp
	db 5, 1, HAYMAKER
	db 5, 2, AGILITY
	db 5, 3, BODY_SLAM
	db 5, 4, ROCK_SLIDE
	db 0

	db AGATHA, 1
	; gengar (fine as-is)
	; golbat
	db 2, 2, DOUBLE_TEAM
	db 2, 2, HYPER_FANG
	db 2, 2, SUPER_FANG
	db 2, 4, LEECH_LIFE
	; parasect
	db 3, 1, SPORE
	db 3, 2, LEECH_LIFE
	db 3, 3, SLASH
	db 3, 4, SHADOW_BALL
	; arbok
	db 4, 1, HYPER_FANG
	db 4, 2, LEECH_LIFE
	db 4, 3, AGILITY
	db 4, 4, EARTHQUAKE
	; gengar
	db 5, 1, SHADOW_BALL
	db 5, 2, PSYCHIC_M
	db 5, 3, THUNDERBOLT
	db 5, 4, DOUBLE_TEAM
	db 0

	db LANCE, 1
	; gyarados
	db 1, 1, DRAGON_CLAW
	db 1, 2, HYDRO_PUMP
	db 1, 3, DRAGON_RAGE
	db 1, 4, HYPER_BEAM
	; dragonair
	db 2, 1, THUNDER_WAVE
	db 2, 2, AGILITY
	db 2, 3, WRAP
	db 2, 4, DRAGON_CLAW
	; charizard
	db 3, 1, FIRE_BLAST
	db 3, 2, DRAGON_CLAW
	db 3, 3, SMOKESCREEN
	db 3, 4, SLASH
	; aerodactyl
	db 4, 1, DRILL_PECK
	db 4, 2, ROCK_SLIDE
	db 4, 3, SWIFT
	db 4, 4, HYPER_BEAM
	; dragonite
	db 5, 1, BLIZZARD
	db 5, 2, DRAGON_CLAW
	db 5, 3, THUNDER
	db 5, 4, HYPER_BEAM
	db 0

	db RIVAL3, 1
	; sandslash
	db 1, 1, EARTHQUAKE
	db 1, 2, PIN_MISSILE
	db 1, 3, SLASH
	db 1, 4, SWORDS_DANCE
	; alakazam
	db 2, 1, PSYCHIC_M
	db 2, 2, RECOVER
	db 2, 3, SEISMIC_TOSS
	db 2, 4, KINESIS
	; exeggutor
	db 3, 1, LEECH_SEED
	db 3, 2, EGG_BOMB
	db 3, 3, PSYCHIC_M
	db 3, 4, SLEEP_POWDER
	; cloyster
	db 4, 1, ICE_BEAM
	db 4, 2, SURF
	db 4, 3, SPIKE_CANNON
	db 4, 4, CLAMP
	; ninetales
	db 5, 1, FLAMETHROWER
	db 5, 2, SHADOW_BALL
	db 5, 3, CONFUSE_RAY
	db 5, 4, ROAR
	; jolteon !!!
	db 6, 3, QUICK_ATTACK
	db 0

	db RIVAL3, 2
	; sandslash
	db 1, 1, EARTHQUAKE
	db 1, 2, PIN_MISSILE
	db 1, 3, SLASH
	db 1, 4, SWORDS_DANCE
	; alakazam
	db 2, 1, PSYCHIC_M
	db 2, 2, RECOVER
	db 2, 3, SEISMIC_TOSS
	db 2, 4, KINESIS
	; exeggutor
	db 3, 1, LEECH_SEED
	db 3, 2, EGG_BOMB
	db 3, 3, PSYCHIC_M
	db 3, 4, SLEEP_POWDER
	; magneton
	db 4, 1, THUNDERBOLT
	db 4, 2, TRI_ATTACK
	db 4, 3, THUNDER_WAVE
	db 4, 4, SUPERSONIC
	; cloyster
	db 5, 1, ICE_BEAM
	db 5, 2, SURF
	db 5, 3, SPIKE_CANNON
	db 5, 4, CLAMP
	; flareon !!!
	db 6, 2, REFLECT
	db 6, 3, QUICK_ATTACK
	db 0

	db RIVAL3, 3
	; sandslash
	db 1, 1, EARTHQUAKE
	db 1, 2, PIN_MISSILE
	db 1, 3, SLASH
	db 1, 4, SWORDS_DANCE
	; alakazam
	db 2, 1, PSYCHIC_M
	db 2, 2, RECOVER
	db 2, 3, SEISMIC_TOSS
	db 2, 4, KINESIS
	; exeggutor
	db 3, 1, LEECH_SEED
	db 3, 2, EGG_BOMB
	db 3, 3, PSYCHIC_M
	db 3, 4, SLEEP_POWDER
	; ninetales
	db 5, 1, FLAMETHROWER
	db 5, 2, SHADOW_BALL
	db 5, 3, CONFUSE_RAY
	db 5, 4, ROAR
	; magneton
	db 5, 1, THUNDERBOLT
	db 5, 2, TRI_ATTACK
	db 5, 3, THUNDER_WAVE
	db 5, 4, SUPERSONIC
	; vaporeon !!!
	db 6, 1, AURORA_BEAM
	db 6, 3, QUICK_ATTACK
	db 0

	db -1 ; end
