PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

PrizeMenuMon1Entries:
	db ELECTABUZZ
	db MAGMAR
	db JYNX
	db "@"

PrizeMenuMon1Cost:
	bcd2 1000
	bcd2 1000
	bcd2 1000
	db "@"

PrizeMenuMon2Entries:
	db EKANS
	db KOFFING
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 500
	bcd2 500
	bcd2 2500
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_CLAW
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 1000
	bcd2 1500
	bcd2 2000
	db "@"
