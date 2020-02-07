var bbr = argument0	//bbox_right
var bbl = argument1 //bbox_left
var bbt = argument2	//bbox_top
var bbb = argument3	//bbox_bottom

var outx = bbr < 0 or bbl > room_width
var outy = bbt > room_width or bbb < 0

return outx + outy * 2