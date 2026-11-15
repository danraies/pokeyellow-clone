MACRO npctrade
; give mon, get mon, dialog id, nickname
	db \1, \2, \3
	dname \4, NAME_LENGTH
ENDM

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width TRADE_DATA_SIZE
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; TRADE_DIALOGSET_EVOLUTION did not refer to evolution in Japanese
	; Red/Green. Japanese Blue changed _AfterTrade2Text to say your Pokémon
	; "went and evolved" and also changed the trades to match. English
	; Red/Blue uses the original JP Red/Green trades but with the JP Blue
	; post-trade text. English Yellow changed _AfterTrade2Text to
	; not mention evolution.
	npctrade HAUNTER,    MR_MIME,   TRADE_DIALOGSET_CASUAL,    "HANZ"    ; used in ROUTE_11_GATE_2F ;;;;;;;;;;;;;;;;;;
	npctrade CLEFAIRY,   FARFETCHD, TRADE_DIALOGSET_CASUAL,    "CANE"    ; used in ROUTE_2_TRADE_HOUSE ;;;;;;;;;;;;;;; <-- This is important
	npctrade BUTTERFREE, BEEDRILL,  TRADE_DIALOGSET_HAPPY,     "STINGER" ; unused ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	npctrade LICKITUNG,  RAICHU,    TRADE_DIALOGSET_CASUAL,    "GORUCHU" ; used in CINNABAR_LAB_FOSSIL_ROOM ;;;;;;;;;;
	npctrade MEW,        MEW,       TRADE_DIALOGSET_HAPPY,     "BART"    ; unused ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	npctrade DEWGONG,    TAUROS,    TRADE_DIALOGSET_CASUAL,    "THUNDER" ; used in ROUTE_18_GATE_2F ;;;;;;;;;;;;;;;;;;
	npctrade PIDGEOT,    PIDGEOT,   TRADE_DIALOGSET_EVOLUTION, "MARTY"   ; unused ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	npctrade VICTREEBEL, OMANYTE,   TRADE_DIALOGSET_EVOLUTION, "HERMES"  ; used in CINNABAR_LAB_TRADE_ROOM ;;;;;;;;;;;
	npctrade VILEPLUME,  KABUTO,    TRADE_DIALOGSET_HAPPY,     "ERWIN"   ; used in CINNABAR_LAB_TRADE_ROOM ;;;;;;;;;;;
	npctrade PARAS,      VULPIX,    TRADE_DIALOGSET_HAPPY,     "ZEPHYR"  ; used in UNDERGROUND_PATH_ROUTE_5 ;;;;;;;;;;
	assert_table_length NUM_NPC_TRADES
