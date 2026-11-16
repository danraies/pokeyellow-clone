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
	db MEOWTH
	db KOFFING
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 500
	bcd2 500
	bcd2 2000
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_CLAW
	db TM_ROCK_SLIDE
	db TM_EARTHQUAKE
	db "@"

PrizeMenuTMsCost:
	bcd2 5000
	bcd2 5000
	bcd2 5000
	db "@"
