/// @desc
//image_index = 0

if type = "room"
	room_goto(target_room)
	
else if type = "Select level"
	room_goto(rLevel_select)
	
else if type = "class"
	global.class = class
	
else if type = "Select class"
	room_goto(rClass_select)
	
else if type = "exit" {
	if room = rMenu
		game_end()
	else
		room_goto(rMenu)
}
else if type = "login" {
	var map = ds_map_create()
	http_request("http://62.113.112.109/index.php/?action=login&name="+global.name+"&pass="+global.pass+"&security="+global.security,"GET",map,"")
	ds_map_destroy(map)
}
else if type = "find game" {
	var map = ds_map_create()
	http_request("http://62.113.112.109/index.php/?action=search&security="+global.security+"&name="+global.name+"&range="+global.search_range,"GET",map,"")
	global.searching = true
	ds_map_destroy(map)
}