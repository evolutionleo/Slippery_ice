var mmr1 = argument0
var mmr2 = argument1
var win = argument2
var value

if(win) {
	value = mmr2/mmr1*50
	if(mmr1 < 2000)
		value *= 4
	else if(mmr1 < 3000)
		value *= 3
	else if(mmr1 < 4000)
		value *= 2
	else if(mmr1 < 5000)
		value *= 1.5
	else if(mmr1 > 6000)
		value /= 1.25
	else if(mmr1 > 7000)
		value /= 1.5
	else if(mmr1 > 8000)
		value /= 1.75
	else if(mmr1 > 9000)
		value /= 2
}
else {
	value = mmr1/mmr2*-50
	if(mmr1 < 2000)
		value /= 4
	else if(mmr1 < 3000)
		value /= 3
	else if(mmr1 < 4000)
		value /= 2
	else if(mmr1 < 5000)
		value /= 1.5
	else if(mmr1 > 6000)
		value *= 1.25
	else if(mmr1 > 7000)
		value *= 1.5
	else if(mmr1 > 8000)
		value *= 1.75
	else if(mmr1 > 9000)
		value *= 2
}

return value