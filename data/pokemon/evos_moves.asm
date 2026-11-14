; Evos+moves data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, min level (1), species
;    * db EVOLVE_TRADE, min level (1), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

EvosMovesPointerTable:
	table_width 2
	dw RhydonEvosMoves
	dw KangaskhanEvosMoves
	dw NidoranMEvosMoves
	dw ClefairyEvosMoves
	dw SpearowEvosMoves
	dw VoltorbEvosMoves
	dw NidokingEvosMoves
	dw SlowbroEvosMoves
	dw IvysaurEvosMoves
	dw ExeggutorEvosMoves
	dw LickitungEvosMoves
	dw ExeggcuteEvosMoves
	dw GrimerEvosMoves
	dw GengarEvosMoves
	dw NidoranFEvosMoves
	dw NidoqueenEvosMoves
	dw CuboneEvosMoves
	dw RhyhornEvosMoves
	dw LaprasEvosMoves
	dw ArcanineEvosMoves
	dw MewEvosMoves
	dw GyaradosEvosMoves
	dw ShellderEvosMoves
	dw TentacoolEvosMoves
	dw GastlyEvosMoves
	dw ScytherEvosMoves
	dw StaryuEvosMoves
	dw BlastoiseEvosMoves
	dw PinsirEvosMoves
	dw TangelaEvosMoves
	dw MissingNo1FEvosMoves
	dw MissingNo20EvosMoves
	dw GrowlitheEvosMoves
	dw OnixEvosMoves
	dw FearowEvosMoves
	dw PidgeyEvosMoves
	dw SlowpokeEvosMoves
	dw KadabraEvosMoves
	dw GravelerEvosMoves
	dw ChanseyEvosMoves
	dw MachokeEvosMoves
	dw MrMimeEvosMoves
	dw HitmonleeEvosMoves
	dw HitmonchanEvosMoves
	dw ArbokEvosMoves
	dw ParasectEvosMoves
	dw PsyduckEvosMoves
	dw DrowzeeEvosMoves
	dw GolemEvosMoves
	dw MissingNo32EvosMoves
	dw MagmarEvosMoves
	dw MissingNo34EvosMoves
	dw ElectabuzzEvosMoves
	dw MagnetonEvosMoves
	dw KoffingEvosMoves
	dw MissingNo38EvosMoves
	dw MankeyEvosMoves
	dw SeelEvosMoves
	dw DiglettEvosMoves
	dw TaurosEvosMoves
	dw MissingNo3DEvosMoves
	dw MissingNo3EEvosMoves
	dw MissingNo3FEvosMoves
	dw FarfetchdEvosMoves
	dw VenonatEvosMoves
	dw DragoniteEvosMoves
	dw MissingNo43EvosMoves
	dw MissingNo44EvosMoves
	dw MissingNo45EvosMoves
	dw DoduoEvosMoves
	dw PoliwagEvosMoves
	dw JynxEvosMoves
	dw MoltresEvosMoves
	dw ArticunoEvosMoves
	dw ZapdosEvosMoves
	dw DittoEvosMoves
	dw MeowthEvosMoves
	dw KrabbyEvosMoves
	dw MissingNo4FEvosMoves
	dw MissingNo50EvosMoves
	dw MissingNo51EvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw MissingNo56EvosMoves
	dw MissingNo57EvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw MissingNo5EEvosMoves
	dw MissingNo5FEvosMoves
	dw SandshrewEvosMoves
	dw SandslashEvosMoves
	dw OmanyteEvosMoves
	dw OmastarEvosMoves
	dw JigglypuffEvosMoves
	dw WigglytuffEvosMoves
	dw EeveeEvosMoves
	dw FlareonEvosMoves
	dw JolteonEvosMoves
	dw VaporeonEvosMoves
	dw MachopEvosMoves
	dw ZubatEvosMoves
	dw EkansEvosMoves
	dw ParasEvosMoves
	dw PoliwhirlEvosMoves
	dw PoliwrathEvosMoves
	dw WeedleEvosMoves
	dw KakunaEvosMoves
	dw BeedrillEvosMoves
	dw MissingNo73EvosMoves
	dw DodrioEvosMoves
	dw PrimeapeEvosMoves
	dw DugtrioEvosMoves
	dw VenomothEvosMoves
	dw DewgongEvosMoves
	dw MissingNo79EvosMoves
	dw MissingNo7AEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw MachampEvosMoves
	dw MissingNo7FEvosMoves
	dw GolduckEvosMoves
	dw HypnoEvosMoves
	dw GolbatEvosMoves
	dw MewtwoEvosMoves
	dw SnorlaxEvosMoves
	dw MagikarpEvosMoves
	dw MissingNo86EvosMoves
	dw MissingNo87EvosMoves
	dw MukEvosMoves
	dw MissingNo8AEvosMoves
	dw KinglerEvosMoves
	dw CloysterEvosMoves
	dw MissingNo8CEvosMoves
	dw ElectrodeEvosMoves
	dw ClefableEvosMoves
	dw WeezingEvosMoves
	dw PersianEvosMoves
	dw MarowakEvosMoves
	dw MissingNo92EvosMoves
	dw HaunterEvosMoves
	dw AbraEvosMoves
	dw AlakazamEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw StarmieEvosMoves
	dw BulbasaurEvosMoves
	dw VenusaurEvosMoves
	dw TentacruelEvosMoves
	dw MissingNo9CEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw MissingNo9FEvosMoves
	dw MissingNoA0EvosMoves
	dw MissingNoA1EvosMoves
	dw MissingNoA2EvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw NidorinoEvosMoves
	dw NidorinaEvosMoves
	dw GeodudeEvosMoves
	dw PorygonEvosMoves
	dw AerodactylEvosMoves
	dw MissingNoACEvosMoves
	dw MagnemiteEvosMoves
	dw MissingNoAEEvosMoves
	dw MissingNoAFEvosMoves
	dw CharmanderEvosMoves
	dw SquirtleEvosMoves
	dw CharmeleonEvosMoves
	dw WartortleEvosMoves
	dw CharizardEvosMoves
	dw MissingNoB5EvosMoves
	dw FossilKabutopsEvosMoves
	dw FossilAerodactylEvosMoves
	dw MonGhostEvosMoves
	dw OddishEvosMoves
	dw GloomEvosMoves
	dw VileplumeEvosMoves
	dw BellsproutEvosMoves
	dw WeepinbellEvosMoves
	dw VictreebelEvosMoves
	assert_table_length NUM_POKEMON_INDEXES

RhyhornEvosMoves:
; 20+25 in safari
; earliest trainers at 30
; Evolutions
	db EVOLVE_LEVEL, 42, RHYDON
	db 0
; Learnset
;	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5, DOUBLE_KICK
	db 10, SAND_ATTACK
	db 15, HORN_ATTACK
	db 20, ROCK_THROW
	db 25, BULLDOZE
	db 30, STOMP
	db 35, LEER
	db 40, ROCK_SLIDE
	db 45, HORN_DRILL
	db 50, EARTHQUAKE
	db 55, DOUBLE_EDGE
	db 0

RhydonEvosMoves:
; Evolutions
	db 0
; Learnset
;	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5, DOUBLE_KICK
	db 10, SAND_ATTACK
	db 15, HORN_ATTACK
	db 20, ROCK_THROW
	db 25, BULLDOZE
	db 30, STOMP
	db 35, LEER
	db 40, ROCK_SLIDE
	db 48, HORN_DRILL
	db 55, EARTHQUAKE
	db 64, DOUBLE_EDGE
	db 0

KangaskhanEvosMoves:
; 28 in safari
; Evolutions
	db 0
; Learnset
;	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 10, LOW_KICK
	db 15, RAGE
	db 20, COMET_PUNCH
	db 26, BITE
	db 31, TAIL_WHIP
	db 36, DOUBLE_KICK
	db 41, BODY_SLAM
	db 46, DIZZY_PUNCH
	db 0

NidoranMEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 17, THRASH
	db 23, BULLDOZE
	db 30, SHARPEN
	db 38, SLUDGE
	db 44, HORN_DRILL
	db 50, EARTHQUAKE
	db 0

NidorinoEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 17, THRASH
	db 23, BULLDOZE
	db 30, SHARPEN
	db 40, SLUDGE
	db 48, HORN_DRILL
	db 56, EARTHQUAKE
	db 0

NidokingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 17, THRASH
	db 23, BULLDOZE
	db 30, SHARPEN
	db 40, SLUDGE
	db 52, HORN_DRILL
	db 64, EARTHQUAKE
	db 0

NidoranFEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 17, BODY_SLAM
	db 23, BULLDOZE
	db 30, HARDEN
	db 38, SLUDGE
	db 44, GLARE
	db 50, EARTHQUAKE
	db 0

NidorinaEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 17, BODY_SLAM
	db 23, BULLDOZE
	db 30, HARDEN
	db 40, SLUDGE
	db 48, GLARE
	db 56, EARTHQUAKE
	db 0

NidoqueenEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, DOUBLE_KICK
	db 12, POISON_STING
	db 17, BODY_SLAM
	db 23, BULLDOZE
	db 30, HARDEN
	db 40, SLUDGE
	db 52, GLARE
	db 64, EARTHQUAKE
	db 0

ClefairyEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
	db 0
; Learnset
;	db POUND, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 13, SING
	db 18, DOUBLESLAP
	db 23, PSYBEAM
	db 28, METRONOME
	db 33, MINIMIZE
	db 38, DEFENSE_CURL
	db 43, REFLECT
	db 48, LIGHT_SCREEN
	db 0

ClefableEvosMoves:
; Evolutions
	db 0
; Learnset
;	db POUND, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 13, SING
	db 18, DOUBLESLAP
	db 23, PSYBEAM
	db 28, METRONOME
	db 33, MINIMIZE
	db 40, DEFENSE_CURL
	db 47, REFLECT
	db 54, LIGHT_SCREEN
	db 0

SpearowEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, FEAROW
	db 0
; Learnset
	db 9, LEER
	db 15, FURY_ATTACK
	db 22, MIRROR_MOVE
	db 29, DRILL_PECK
	db 36, RAZOR_WIND
	db 45, AGILITY
	db 0

FearowEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LEER
	db 15, FURY_ATTACK
	db 25, MIRROR_MOVE
	db 34, DRILL_PECK
	db 43, RAZOR_WIND
	db 51, AGILITY
	db 0

VoltorbEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0
; Learnset
;	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db 15, THUNDERSHOCK
	db 20, SONICBOOM
	db 25, SELFDESTRUCT
	db 30, THUNDER_WAVE
	db 35, SWIFT
	db 40, THUNDERBOLT
	db 45, LIGHT_SCREEN
	db 50, TAKE_DOWN
	db 55, EXPLOSION
	db 0

ElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, THUNDERSHOCK
	db 20, SONICBOOM
	db 25, SELFDESTRUCT
	db 30, THUNDER_WAVE
	db 35, SWIFT
	db 42, THUNDERBOLT
	db 49, LIGHT_SCREEN
	db 56, TAKE_DOWN
	db 63, EXPLOSION
	db 0

SlowpokeEvosMoves:
; 15 in the wild
; 17, 20+ on trainers
; Evolutions
	db EVOLVE_LEVEL, 37, SLOWBRO
	db 0
; Learnset
;	db WATER_GUN, NO_MOVE, NO_MOVE, NO_MOVE; level 1 learnset
	db 8, TACKLE
	db 12, DISABLE
	db 15, GROWL
	db 18, CONFUSION
	db 22, HEADBUTT
	db 27, BUBBLEBEAM
	db 33, REST
	db 40, AMNESIA
	db 48, PSYCHIC_M
	db 0

SlowbroEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, TACKLE
	db 12, DISABLE
	db 15, GROWL
	db 18, CONFUSION
	db 22, HEADBUTT
	db 27, BUBBLEBEAM
	db 33, REST
	db 37, WITHDRAW
	db 44, AMNESIA
	db 55, PSYCHIC_M
	db 0

BulbasaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 12, VINE_WHIP
	db 17, POISONPOWDER
	db 22, WRAP
	db 27, RAZOR_LEAF
	db 32, LEECH_LIFE
	db 37, GROWTH
	db 42, SLEEP_POWDER
	db 47, SOLARBEAM
	db 0

IvysaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 12, VINE_WHIP
	db 17, POISONPOWDER
	db 23, WRAP
	db 29, RAZOR_LEAF
	db 35, LEECH_LIFE
	db 40, GROWTH
	db 45, SLEEP_POWDER
	db 50, SOLARBEAM
	db 0

VenusaurEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEECH_SEED
	db 12, VINE_WHIP
	db 17, POISONPOWDER
	db 23, WRAP
	db 29, RAZOR_LEAF
	db 35, LEECH_LIFE
	db 41, GROWTH
	db 47, SLEEP_POWDER
	db 53, SOLARBEAM
	db 0

CharmanderEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0
; Learnset
	db 7, EMBER
	db 12, SMOKESCREEN
	db 17, SEISMIC_TOSS
	db 22, FIRE_SPIN
	db 27, SLASH
	db 32, DRAGON_CLAW
	db 37, FLAMETHROWER
	db 42, ROAR
	db 47, FIRE_BLAST
	db 0

CharmeleonEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0
; Learnset
	db 7, EMBER
	db 12, SMOKESCREEN
	db 17, SEISMIC_TOSS
	db 23, FIRE_SPIN
	db 29, SLASH
	db 35, DRAGON_CLAW
	db 40, FLAMETHROWER
	db 45, ROAR
	db 50, FIRE_BLAST
	db 0

CharizardEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, EMBER
	db 12, SMOKESCREEN
	db 17, SEISMIC_TOSS
	db 23, FIRE_SPIN
	db 29, SLASH
	db 35, DRAGON_CLAW
	db 41, FLAMETHROWER
	db 47, ROAR
	db 53, FIRE_BLAST
	db 0

SquirtleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0
; Learnset
	db 7, WATER_GUN
	db 12, HAZE
	db 17, BITE
	db 22, BUBBLEBEAM
	db 27, WITHDRAW
	db 32, AURORA_BEAM
	db 37, TOXIC
	db 42, SKULL_BASH
	db 47, HYDRO_PUMP
	db 0

WartortleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 34, BLASTOISE
	db 0
; Learnset
	db 7, WATER_GUN
	db 12, HAZE
	db 17, BITE
	db 23, BUBBLEBEAM
	db 29, WITHDRAW
	db 35, AURORA_BEAM
	db 40, TOXIC
	db 45, SKULL_BASH
	db 50, HYDRO_PUMP
	db 0

BlastoiseEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, WATER_GUN
	db 12, HAZE
	db 17, BITE
	db 23, BUBBLEBEAM
	db 29, WITHDRAW
	db 35, AURORA_BEAM
	db 41, TOXIC
	db 47, SKULL_BASH
	db 53, HYDRO_PUMP
	db 0

ExeggcuteEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
; Learnset
;	db FURY_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 8, ABSORB
	db 12, CONFUSION
	db 16, SLEEP_POWDER
	db 22, MEGA_DRAIN
	db 28, REFLECT
	db 32, PSYBEAM
	db 37, LEECH_SEED
	db 42, EGG_BOMB
	db 48, GROWTH
	db 0

ExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, ABSORB
	db 12, CONFUSION
	db 16, SLEEP_POWDER
	db 22, MEGA_DRAIN
	db 28, REFLECT
	db 32, PSYBEAM
	db 40, LEECH_SEED
	db 49, EGG_BOMB
	db 58, GROWTH
	db 0

PikachuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
	db 0
; Learnset
	db 6, QUICK_ATTACK
	db 8, THUNDER_WAVE
	db 11, DOUBLE_TEAM
	db 15, LOW_KICK
	db 20, BODY_SLAM
	db 26, THUNDERBOLT
	db 33, AGILITY
	db 41, THUNDER
	db 50, LIGHT_SCREEN
	db 0

RaichuEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, QUICK_ATTACK
	db 8, THUNDER_WAVE
	db 11, DOUBLE_TEAM
	db 15, LOW_KICK
	db 23, BODY_SLAM
	db 30, THUNDERBOLT
	db 37, ICE_PUNCH
	db 44, THUNDER
	db 60, LIGHT_SCREEN
	db 0

LickitungEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, STOMP
	db 19, LICK
	db 27, DEFENSE_CURL
	db 35, SUBMISSION
	db 43, SCREECH
	db 51, HAYMAKER
	db 59, DOUBLE_EDGE
	db 0

GrimerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 38, MUK
	db 0
; Learnset
	db 11, SMOG
	db 16, TOXIC
	db 22, MINIMIZE
	db 28, FURY_ATTACK
	db 33, SLUDGE
	db 37, LEECH_LIFE
	db 42, LICK
	db 48, SCREECH
	db 55, ACID_ARMOR
	db 0

MukEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, SMOG
	db 16, TOXIC
	db 22, MINIMIZE
	db 28, FURY_ATTACK
	db 33, SLUDGE
	db 37, LEECH_LIFE
	db 44, LICK
	db 52, SCREECH
	db 60, ACID_ARMOR
	db 0

KoffingEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 35, WEEZING
	db 0
; Learnset
	db 8, SLAM
	db 12, MEGA_DRAIN
	db 18, SMOKESCREEN
	db 26, LEECH_SEED
	db 32, SLUDGE
	db 37, SKULL_BASH
	db 40, SELFDESTRUCT
	db 45, HAZE
	db 48, EXPLOSION
	db 0

WeezingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, SLAM
	db 12, MEGA_DRAIN
	db 18, SMOKESCREEN
	db 26, LEECH_SEED
	db 32, SLUDGE
	db 39, SKULL_BASH
	db 43, SELFDESTRUCT
	db 49, HAZE
	db 53, EXPLOSION
	db 0

GastlyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0
; Learnset
	db 8, NIGHT_SHADE
	db 15, LICK
	db 21, GLARE
	db 28, PSYBEAM
	db 32, SUBSTITUTE
	db 39, HYPNOSIS
	db 44, SHADOW_BALL
	db 50, DREAM_EATER
	db 0

HaunterEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 50, GENGAR
	db 0
; Learnset
	db 8, NIGHT_SHADE
	db 15, LICK
	db 21, GLARE
	db 28, PSYBEAM
	db 34, SUBSTITUTE
	db 43, HYPNOSIS
	db 48, SHADOW_BALL
	db 54, DREAM_EATER
	db 0

GengarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, NIGHT_SHADE
	db 15, LICK
	db 21, GLARE
	db 28, PSYBEAM
	db 34, SUBSTITUTE
	db 43, HYPNOSIS
	db 48, SHADOW_BALL
	db 58, DREAM_EATER
	db 0

ParasEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 17, PARASECT
	db 0
; Learnset
	db 10, STUN_SPORE
	db 15, MINIMIZE
	db 20, LEECH_LIFE
	db 27, SPORE
	db 34, SLASH
	db 41, SHADOW_BALL
	db 47, GROWTH
	db 0

ParasectEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, STUN_SPORE
	db 15, MINIMIZE
	db 20, LEECH_LIFE
	db 30, SPORE
	db 39, SLASH
	db 47, SHADOW_BALL
	db 55, GROWTH
	db 0

CuboneEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0
; Learnset
	db 10, HEADBUTT
	db 13, TAIL_WHIP
	db 18, BULLDOZE
	db 25, ROCK_THROW
	db 31, BODY_SLAM
	db 38, THRASH
	db 43, BONEMERANG
	db 46, RAGE
	db 0

MarowakEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, HEADBUTT
	db 13, TAIL_WHIP
	db 18, BULLDOZE
	db 25, ROCK_THROW
	db 33, BODY_SLAM
	db 41, THRASH
	db 48, BONEMERANG
	db 55, RAGE
	db 0

LaprasEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, SING
	db 20, MIST
	db 25, BODY_SLAM
	db 31, CONFUSE_RAY
	db 38, ICE_BEAM
	db 46, HYDRO_PUMP
	db 0

GrowlitheEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
	db 0
; Learnset
	db 18, EMBER
	db 23, GROWL
	db 30, TAKE_DOWN
	db 37, DIG
	db 44, AGILITY
	db 50, FLAMETHROWER
	db 0

ArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, EMBER
	db 23, GROWL
	db 33, TAKE_DOWN
	db 40, DIG
	db 48, AGILITY
	db 55, FLAMETHROWER
	db 0

MagikarpEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0
; Learnset
	db 15, TACKLE
	db 0

GyaradosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, BITE
	db 25, DRAGON_RAGE
	db 30, WATERFALL
	db 35, AGILITY
	db 40, DRAGON_CLAW
	db 45, HYPER_FANG
	db 50, HYDRO_PUMP
	db 55, HYPER_BEAM
	db 0

AerodactylEvosMoves:
; Evolutions
	db 0
; Learnset 
	db 10, SUPERSONIC
	db 16, BITE
	db 25, ROCK_THROW
	db 33, DRILL_PECK
	db 38, TAKE_DOWN
	db 45, ROCK_SLIDE
	db 54, HYPER_BEAM
	db 0

DratiniEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0
; Learnset
	db 10, BODY_SLAM
	db 20, THUNDER_WAVE
	db 30, AGILITY
	db 40, DRAGON_CLAW
	db 50, HYPER_BEAM
	db 0

DragonairEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0
; Learnset
	db 10, BODY_SLAM
	db 20, THUNDER_WAVE
	db 35, AGILITY
	db 45, DRAGON_CLAW
	db 55, HYPER_BEAM
	db 0

DragoniteEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BODY_SLAM
	db 20, THUNDER_WAVE
	db 35, AGILITY
	db 45, DRAGON_CLAW
	db 60, HYPER_BEAM
	db 0

ShellderEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
	db 0
; Learnset
	db 18, SUPERSONIC
	db 23, CLAMP
	db 30, AURORA_BEAM
	db 37, BUBBLEBEAM
	db 44, ICE_BEAM
	db 52, SPIKE_CANNON
	db 0

CloysterEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, SUPERSONIC
	db 23, CLAMP
	db 30, AURORA_BEAM
	db 39, BUBBLEBEAM
	db 47, ICE_BEAM
	db 56, SPIKE_CANNON
	db 0

TentacoolEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0
; Learnset
	db 7, SUPERSONIC
	db 13, WRAP
	db 18, CONSTRICT
	db 22, BUBBLEBEAM
	db 27, SLUDGE
	db 33, BARRIER
	db 40, SCREECH
	db 48, HYDRO_PUMP
	db 0

TentacruelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, SUPERSONIC
	db 13, WRAP
	db 18, CONSTRICT
	db 22, BUBBLEBEAM
	db 27, SLUDGE
	db 35, BARRIER
	db 43, SCREECH
	db 50, HYDRO_PUMP
	db 0

ScytherEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BUG_BITE
	db 17, DOUBLE_TEAM
	db 20, WING_ATTACK
	db 24, SLASH
	db 29, AGILITY
	db 35, PIN_MISSILE
	db 42, SWORDS_DANCE
	db 50, DOUBLE_EDGE
	db 0

PinsirEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BUG_BITE
	db 17, HARDEN
	db 20, SEISMIC_TOSS
	db 24, BIND
	db 29, LEECH_LIFE
	db 35, SUBMISSION
	db 42, GUILLOTINE
	db 50, SWORDS_DANCE
	db 0

StaryuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, STARMIE
	db 0
; Learnset
	db 7, HARDEN
	db 16, WATER_GUN
	db 21, SWIFT
	db 27, RECOVER
	db 32, PSYBEAM
	db 37, MINIMIZE
	db 42, LIGHT_SCREEN
	db 47, HYDRO_PUMP
	db 0

StarmieEvosMoves:
; Evolutions
	db 7, HARDEN
	db 16, WATER_GUN
	db 21, SWIFT
	db 27, RECOVER
	db 32, PSYBEAM
	db 39, MINIMIZE
	db 47, LIGHT_SCREEN
	db 55, HYDRO_PUMP
	db 0
; Learnset
	db 0

TangelaEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, VINE_WHIP
	db 17, LICK
	db 24, MEGA_DRAIN
	db 27, BIND
	db 32, STUN_SPORE
	db 36, LEECH_LIFE
	db 39, SLEEP_POWDER
	db 45, SHADOW_BALL
	db 48, GROWTH
	db 0

OnixEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, BIND
	db 19, ROCK_THROW
	db 25, RAGE
	db 33, SLAM
	db 38, ROCK_SLIDE
	db 43, HARDEN
	db 48, EARTHQUAKE
	db 0

PidgeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 12, QUICK_ATTACK
	db 19, WHIRLWIND
	db 27, WING_ATTACK
	db 33, RAZOR_WIND
	db 39, AGILITY
	db 44, MIRROR_MOVE
	db 0

PidgeottoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 12, QUICK_ATTACK
	db 21, WHIRLWIND
	db 30, WING_ATTACK
	db 36, RAZOR_WIND
	db 42, AGILITY
	db 49, MIRROR_MOVE
	db 0

PidgeotEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 12, QUICK_ATTACK
	db 21, WHIRLWIND
	db 30, WING_ATTACK
	db 38, RAZOR_WIND
	db 46, AGILITY
	db 54, MIRROR_MOVE
	db 0

AbraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, KADABRA
	db 0
; Learnset
	db 8, CONFUSION
	db 15, KINESIS
	db 0

KadabraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 45, ALAKAZAM
	db 0
; Learnset
	db 8, CONFUSION
	db 15, KINESIS
	db 20, DISABLE
	db 27, PSYBEAM
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 42, REFLECT
	db 0

AlakazamEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, CONFUSION
	db 15, KINESIS
	db 20, DISABLE
	db 27, PSYBEAM
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 42, REFLECT
	db 0

GeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0
; Learnset
	db 11, DEFENSE_CURL
	db 16, ROCK_THROW
	db 21, SELFDESTRUCT
	db 26, ROLLING_KICK
	db 31, EARTHQUAKE
	db 36, EXPLOSION
	db 0

GravelerEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, GOLEM
	db 0
; Learnset
	db 11, DEFENSE_CURL
	db 16, ROCK_THROW
	db 21, SELFDESTRUCT
	db 29, ROLLING_KICK
	db 36, EARTHQUAKE
	db 43, EXPLOSION
	db 0

GolemEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, DEFENSE_CURL
	db 16, ROCK_THROW
	db 21, SELFDESTRUCT
	db 29, ROLLING_KICK
	db 36, EARTHQUAKE
	db 43, EXPLOSION
	db 0

MachopEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0
; Learnset
	db 20, LOW_KICK
	db 25, MEDITATE
	db 30, BODY_SLAM
	db 35, AGILITY
	db 40, ROCK_SLIDE
	db 45, GLARE
	db 50, HAYMAKER
	db 0

MachokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 50, MACHOKE
	db 0
; Learnset
	db 20, LOW_KICK
	db 25, MEDITATE
	db 31, BODY_SLAM
	db 37, AGILITY
	db 42, ROCK_SLIDE
	db 47, GLARE
	db 52, HAYMAKER
	db 0

MachampEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, LOW_KICK
	db 25, MEDITATE
	db 31, BODY_SLAM
	db 37, AGILITY
	db 42, ROCK_SLIDE
	db 47, GLARE
	db 54, HAYMAKER
	db 0

MrMimeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, CONFUSION
	db 23, LIGHT_SCREEN
	db 31, AMNESIA
	db 39, SUBSTITUTE
	db 47, SHADOW_BALL
	db 52, PSYCHIC_M
	db 0

HitmonleeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 33, ROLLING_KICK
	db 38, JUMP_KICK
	db 43, SKULL_BASH
	db 48, HI_JUMP_KICK
	db 53, MEGA_KICK
	db 0

HitmonchanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 33, FIRE_PUNCH
	db 38, ICE_PUNCH
	db 43, THUNDERPUNCH
	db 48, HAYMAKER
	db 53, COUNTER
	db 0

EkansEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, ARBOK
	db 0
; Learnset
	db 10, WRAP
	db 17, BITE
	db 24, GLARE
	db 31, HYPER_FANG
	db 38, SLUDGE
	db 42, LEECH_LIFE
	db 46, EARTHQUAKE
	db 0

ArbokEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, WRAP
	db 17, BITE
	db 27, GLARE
	db 36, HYPER_FANG
	db 45, SLUDGE
	db 50, LEECH_LIFE
	db 55, EARTHQUAKE
	db 0

PsyduckEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0
; Learnset
	db 9, SEISMIC_TOSS
	db 16, CONFUSION
	db 22, HEADBUTT
	db 28, BUBBLEBEAM
	db 31, FURY_SWIPES
	db 36, ICE_PUNCH
	db 43, DRAGON_CLAW
	db 52, HYDRO_PUMP
	db 0

GolduckEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, SEISMIC_TOSS
	db 16, CONFUSION
	db 22, HEADBUTT
	db 28, BUBBLEBEAM
	db 31, FURY_SWIPES
	db 39, ICE_PUNCH
	db 48, DRAGON_CLAW
	db 59, HYDRO_PUMP
	db 0

DrowzeeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, HYPNO
	db 0
; Learnset
	db 12, CONFUSION
	db 17, POISON_GAS
	db 24, HEADBUTT
	db 29, MEDITATE
	db 32, PSYCHIC_M
	db 37, DREAM_EATER
	db 0

HypnoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, CONFUSION
	db 17, POISON_GAS
	db 24, HEADBUTT
	db 33, MEDITATE
	db 37, PSYCHIC_M
	db 43, DREAM_EATER
	db 0

JynxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, DOUBLESLAP
	db 25, LICK
	db 30, PSYBEAM
	db 35, ICE_PUNCH
	db 40, NIGHT_SHADE
	db 45, PSYCHIC_M
	db 50, BLIZZARD
	db 0

MagmarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, CONFUSE_RAY
	db 25, LOW_KICK
	db 30, DIZZY_PUNCH
	db 35, FIRE_PUNCH
	db 40, SMOKESCREEN
	db 45, THRASH
	db 50, FIRE_BLAST
	db 0

ElectabuzzEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, THUNDER_WAVE
	db 25, LOW_KICK
	db 30, DIZZY_PUNCH
	db 35, THUNDERPUNCH
	db 40, LIGHT_SCREEN
	db 45, THRASH
	db 50, THUNDER
	db 0

MagnemiteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0
; Learnset
	db 15, SONICBOOM
	db 21, THUNDERSHOCK
	db 25, SUPERSONIC
	db 29, SWIFT
	db 35, THUNDER_WAVE
	db 41, THUNDERBOLT
	db 47, TRI_ATTACK
	db 0

MagnetonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, SONICBOOM
	db 21, THUNDERSHOCK
	db 25, SUPERSONIC
	db 29, SWIFT
	db 38, THUNDER_WAVE
	db 46, THUNDERBOLT
	db 54, TRI_ATTACK
	db 0

MankeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0
; Learnset
	db 9, LOW_KICK
	db 15, SEISMIC_TOSS
	db 21, FURY_SWIPES
	db 27, TWINEEDLE
	db 33, HAYMAKER
	db 39, THRASH
	db 45, SCREECH
	db 0

PrimeapeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LOW_KICK
	db 15, SEISMIC_TOSS
	db 21, FURY_SWIPES
	db 27, TWINEEDLE
	db 37, HAYMAKER
	db 46, THRASH
	db 45, SCREECH
	db 0

SeelEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0
; Learnset
	db 25, LICK
	db 30, BUBBLEBEAM
	db 35, AURORA_BEAM
	db 40, REST
	db 45, DEFENSE_CURL
	db 50, ICE_BEAM
	db 0

DewgongEvosMoves:
; Evolutions
	db 0
; Learnset
	db 25, LICK
	db 30, BUBBLEBEAM
	db 36, AURORA_BEAM
	db 42, REST
	db 48, DEFENSE_CURL
	db 54, ICE_BEAM
	db 0

DiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0
; Learnset
	db 9, BULLDOZE
	db 15, GROWL
	db 19, DIG
	db 24, MINIMIZE
	db 31, SLASH
	db 40, EARTHQUAKE
	db 0

DugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BULLDOZE
	db 15, GROWL
	db 19, DIG
	db 24, MINIMIZE
	db 35, SLASH
	db 47, EARTHQUAKE
	db 0

TaurosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 21, STOMP
	db 28, DOUBLE_KICK
	db 35, ROAR
	db 44, DOUBLE_EDGE
	db 51, EARTHQUAKE
	db 0

FarfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, AGILITY
	db 15, FURY_ATTACK
	db 23, WING_ATTACK
	db 31, SWORDS_DANCE
	db 39, SLASH
	db 0

VenonatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0
; Learnset
	db 9, BUG_BITE
	db 14, SUPERSONIC
	db 19, CONFUSION
	db 22, POISONPOWDER
	db 27, LEECH_LIFE
	db 30, STUN_SPORE
	db 35, PSYBEAM
	db 38, SLEEP_POWDER
	db 43, PSYCHIC_M
	db 0

VenomothEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, BUG_BITE
	db 14, SUPERSONIC
	db 19, CONFUSION
	db 22, POISONPOWDER
	db 27, LEECH_LIFE
	db 30, STUN_SPORE
	db 38, PSYBEAM
	db 43, SLEEP_POWDER
	db 50, PSYCHIC_M
	db 0

DoduoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, DODRIO
	db 0
; Learnset
	db 10, QUICK_ATTACK
	db 18, GROWL
	db 24, FURY_ATTACK
	db 30, DRILL_PECK
	db 36, AGILITY
	db 40, TRI_ATTACK
	db 44, HI_JUMP_KICK
	db 0

DodrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, QUICK_ATTACK
	db 18, GROWL
	db 24, FURY_ATTACK
	db 30, DRILL_PECK
	db 39, AGILITY
	db 45, TRI_ATTACK
	db 51, HI_JUMP_KICK
	db 0

PoliwagEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0
; Learnset
	db 16, LOW_KICK
	db 19, PSYBEAM
	db 25, BODY_SLAM
	db 31, HAYMAKER
	db 38, AMNESIA
	db 45, HYDRO_PUMP
	db 0

PoliwhirlEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
	db 0
; Learnset
	db 16, LOW_KICK
	db 19, PSYBEAM
	db 26, BODY_SLAM
	db 33, HAYMAKER
	db 41, AMNESIA
	db 49, HYDRO_PUMP
	db 0

PoliwrathEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, LOW_KICK
	db 19, PSYBEAM
	db 26, BODY_SLAM
	db 33, HAYMAKER
	db 42, AMNESIA
	db 52, HYDRO_PUMP
	db 0

MoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, FIRE_BLAST
	db 55, AGILITY
	db 60, REFLECT
	db 0

ArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, BLIZZARD
	db 55, AGILITY
	db 60, MIST
	db 0

ZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 51, THUNDER
	db 55, AGILITY
	db 60, LIGHT_SCREEN
	db 0

DittoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0
; Learnset
	db 12, PAY_DAY
	db 17, SCREECH
	db 24, DIG
	db 33, FURY_SWIPES
	db 44, SLASH
	db 0

PersianEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, PAY_DAY
	db 17, SCREECH
	db 24, DIG
	db 37, FURY_SWIPES
	db 51, SLASH
	db 0

KrabbyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, KINGLER
	db 0
; Learnset
	db 20, HARDEN
	db 25, STOMP
	db 30, DRAGON_CLAW
	db 35, CRABHAMMER
	db 40, GUILLOTINE
	db 0

KinglerEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, HARDEN
	db 25, STOMP
	db 34, DRAGON_CLAW
	db 42, CRABHAMMER
	db 49, GUILLOTINE
	db 0

VulpixEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
	db 0
; Learnset
	db 16, FIRE_SPIN
	db 21, ROAR
	db 28, CONFUSE_RAY
	db 35, FLAMETHROWER
	db 42, SHADOW_BALL
	db 0

NinetalesEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, FIRE_SPIN
	db 21, ROAR
	db 30, CONFUSE_RAY
	db 40, FLAMETHROWER
	db 50, SHADOW_BALL
	db 0

KabutoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 39, KABUTOPS
	db 0
; Learnset
	db 34, LEECH_LIFE
	db 38, SLASH
	db 42, SWORDS_DANCE
	db 46, ROCK_SLIDE
	db 50, HYDRO_PUMP
	db 0

KabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, LEECH_LIFE
	db 40, SLASH
	db 45, SWORDS_DANCE
	db 50, ROCK_SLIDE
	db 55, HYDRO_PUMP
	db 0

OmanyteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 39, OMASTAR
	db 0
; Learnset
	db 34, MEGA_DRAIN
	db 38, SPIKE_CANNON
	db 42, AMNESIA
	db 46, ROCK_SLIDE
	db 50, HYDRO_PUMP
	db 0

OmastarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, MEGA_DRAIN
	db 40, SPIKE_CANNON
	db 45, AMNESIA
	db 50, ROCK_SLIDE
	db 55, HYDRO_PUMP
	db 0

HorseaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, SEADRA
	db 0
; Learnset
	db 19, AGILITY
	db 24, BUBBLEBEAM
	db 30, SWIFT
	db 37, DRAGON_CLAW
	db 45, HYDRO_PUMP
	db 0

SeadraEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, AGILITY
	db 24, BUBBLEBEAM
	db 30, SWIFT
	db 41, DRAGON_CLAW
	db 52, HYDRO_PUMP
	db 0

SandshrewEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0
; Learnset
	db 10, SAND_ATTACK
	db 17, BULLDOZE
	db 24, SLASH
	db 31, PIN_MISSILE
	db 38, EARTHQUAKE
	db 0

SandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SAND_ATTACK
	db 17, BULLDOZE
	db 27, SLASH
	db 36, PIN_MISSILE
	db 47, EARTHQUAKE
	db 0

JigglypuffEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
	db 0
; Learnset
	db 9, DOUBLESLAP
	db 14, DEFENSE_CURL
	db 19, MEGA_DRAIN
	db 24, BODY_SLAM
	db 29, REST
	db 34, PSYBEAM
	db 39, DOUBLE_EDGE
	db 0

WigglytuffEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, DOUBLESLAP
	db 14, DEFENSE_CURL
	db 19, MEGA_DRAIN
	db 24, BODY_SLAM
	db 29, REST
	db 37, PSYBEAM
	db 45, DOUBLE_EDGE
	db 0

ZubatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0
; Learnset
	db 10, BITE
	db 15, LICK
	db 21, WING_ATTACK
	db 28, LEECH_LIFE
	db 34, HYPER_FANG
	db 38, HAZE
	db 42, SUPER_FANG
	db 0

GolbatEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BITE
	db 15, LICK
	db 21, WING_ATTACK
	db 30, LEECH_LIFE
	db 37, HYPER_FANG
	db 40, HAZE
	db 45, SUPER_FANG
	db 0

PorygonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SWIFT
	db 15, THUNDER_WAVE
	db 20, PSYBEAM
	db 25, RECOVER
	db 30, THUNDERBOLT
	db 35, ICE_BEAM
	db 40, TRI_ATTACK
	db 45, SHADOW_BALL
	db 0

MewtwoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 71, SHADOW_BALL
	db 72, MIST
	db 73, AMNESIA
	db 0

SnorlaxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 35, BODY_SLAM
	db 40, REST
	db 45, DOUBLE_EDGE
	db 50, THUNDERPUNCH
	db 55, ICE_PUNCH
	db 60, HYPER_BEAM
	db 0

GoldeenEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, SEAKING
	db 0
; Learnset
	db 19, WATER_GUN
	db 24, HORN_ATTACK
	db 30, AGILITY
	db 37, WATERFALL
	db 45, DRILL_PECK
	db 54, HORN_DRILL
	db 0

SeakingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, WATER_GUN
	db 24, HORN_ATTACK
	db 30, AGILITY
	db 39, WATERFALL
	db 48, DRILL_PECK
	db 56, HORN_DRILL
	db 0

PonytaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0
; Learnset
	db 15, STOMP
	db 23, LICK
	db 31, FIRE_SPIN
	db 35, AGILITY
	db 39, BODY_SLAM
	db 43, FLAMETHROWER
	db 47, EARTHQUAKE
	db 0

RapidashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, STOMP
	db 23, LICK
	db 31, FIRE_SPIN
	db 35, AGILITY
	db 39, BODY_SLAM
	db 47, FLAMETHROWER
	db 55, EARTHQUAKE
	db 0

RattataEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, RATICATE
	db 0
; Learnset
	db 7, BITE
	db 14, HYPER_FANG
	db 23, AGILITY
	db 29, ROLLING_KICK
	db 34, SUPER_FANG
	db 0

RaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, BITE
	db 14, HYPER_FANG
	db 27, AGILITY
	db 34, ROLLING_KICK
	db 41, SUPER_FANG
	db 0

OddishEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, GLOOM
	db 0
; Learnset
	db 10, FURY_ATTACK
	db 15, STUN_SPORE
	db 17, MEGA_DRAIN
	db 19, SLEEP_POWDER
	db 21, SLUDGE
	db 24, LEECH_SEED
	db 33, PETAL_DANCE
	db 40, GROWTH
	db 46, RECOVER
	db 0

GloomEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
	db 0
; Learnset
	db 10, FURY_ATTACK
	db 15, STUN_SPORE
	db 17, MEGA_DRAIN
	db 19, SLEEP_POWDER
	db 23, SLUDGE
	db 28, LEECH_SEED
	db 38, PETAL_DANCE
	db 46, GROWTH
	db 52, RECOVER
	db 0

VileplumeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, FURY_ATTACK
	db 15, STUN_SPORE
	db 17, MEGA_DRAIN
	db 19, SLEEP_POWDER
	db 23, SLUDGE
	db 28, LEECH_SEED
	db 38, PETAL_DANCE
	db 48, GROWTH
	db 56, RECOVER
	db 0

BellsproutEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0
; Learnset
	db 13, WRAP
	db 15, STUN_SPORE
	db 18, SLEEP_POWDER
	db 21, SLUDGE
	db 26, RAZOR_LEAF
	db 33, LEECH_LIFE
	db 42, HYPER_FANG
	db 0

WeepinbellEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
	db 0
; Learnset
	db 13, WRAP
	db 15, STUN_SPORE
	db 18, SLEEP_POWDER
	db 23, SLUDGE
	db 29, RAZOR_LEAF
	db 38, LEECH_LIFE
	db 49, HYPER_FANG
	db 0

VictreebelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, WRAP
	db 15, STUN_SPORE
	db 18, SLEEP_POWDER
	db 23, SLUDGE
	db 32, RAZOR_LEAF
	db 40, LEECH_LIFE
	db 53, HYPER_FANG
	db 0

WeedleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0
; Learnset
	db 0

KakunaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0
; Learnset
	db 0

BeedrillEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, FURY_ATTACK
	db 13, AGILITY
	db 17, SLUDGE
	db 20, TWINEEDLE
	db 25, SLASH
	db 30, PIN_MISSILE
	db 35, SWORDS_DANCE
	db 0

CaterpieEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, METAPOD
	db 0
; Learnset
	db 0

MetapodEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0
; Learnset
	db 7, HARDEN
	db 0

ButterfreeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, CONFUSION
	db 13, STUN_SPORE
	db 14, GUST
	db 15, SLEEP_POWDER
	db 18, MEGA_DRAIN
	db 23, WHIRLWIND
	db 28, RAZOR_WIND
	db 34, PSYBEAM
	db 40, LEECH_LIFE
	db 0

ChanseyEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, SING
	db 18, PSYBEAM
	db 24, ICE_PUNCH
	db 30, FIRE_PUNCH
	db 36, SOFTBOILED
	db 42, DEFENSE_CURL
	db 48, LIGHT_SCREEN
	db 54, EGG_BOMB
	db 60, SELFDESTRUCT
	db 0

MewEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, BODY_SLAM
	db 10, TRANSFORM
	db 15, SHADOW_BALL
	db 20, LEECH_LIFE
	db 25, SOFTBOILED
	db 30, METRONOME
	db 35, SWORDS_DANCE
	db 40, PSYCHIC_M
	db 45, EARTHQUAKE
	db 50, SKULL_BASH
	db 0

EeveeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
	db EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
	db 0
; Learnset
	db 6, QUICK_ATTACK
	db 8, SAND_ATTACK
	db 11, BITE
	db 14, DOUBLE_KICK
	db 20, LICK
	db 26, DOUBLE_TEAM
	db 32, DIG
	db 38, BODY_SLAM
	db 44, SKULL_BASH
	db 0

FlareonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, QUICK_ATTACK
	db 8, SAND_ATTACK
	db 11, BITE
	db 14, EMBER
	db 20, LICK
	db 26, FIRE_SPIN
	db 32, FLAMETHROWER
	db 38, DRAGON_CLAW
	db 44, SKULL_BASH
	db 50, FIRE_BLAST
	db 0

JolteonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, QUICK_ATTACK
	db 8, SAND_ATTACK
	db 11, BITE
	db 14, THUNDERSHOCK
	db 20, LICK
	db 26, THUNDER_WAVE
	db 32, THUNDERBOLT
	db 38, PIN_MISSILE
	db 44, SKULL_BASH
	db 50, THUNDER
	db 0

VaporeonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, QUICK_ATTACK
	db 8, SAND_ATTACK
	db 11, BITE
	db 14, WATER_GUN
	db 20, LICK
	db 26, HAZE
	db 32, BUBBLEBEAM
	db 38, ICE_BEAM
	db 44, SKULL_BASH
	db 50, HYDRO_PUMP
	db 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MissingNo1FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo20EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoAEEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoAFEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoB5EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FossilKabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FossilAerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MonGhostEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoACEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo38EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3DEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo43EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo44EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo45EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo4FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo50EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo51EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo56EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo57EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo5EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo5FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo73EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo79EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo7AEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo7FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo86EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo87EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo8AEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo8CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo92EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo9CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo9FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA0EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA1EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA2EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo32EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo34EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0