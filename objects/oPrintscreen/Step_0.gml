/// @desc
if(keyboard_check_pressed(vk_printscreen)) {
	screen_save(string(game_id+screen_count)+".png")
}