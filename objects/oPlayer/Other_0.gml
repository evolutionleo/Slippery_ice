/// @desc DIE!
//room_restart()
if(x < 0 or x > room_width or y > room_height) {
	visible = false
	if(alarm[5] != 90) {
		alarm[5] = 90
	}
}