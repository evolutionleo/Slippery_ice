/// @desc
//image_index = 0

if type = "room"
	room_goto(target_room)
	
else if type = "Select level"
	room_goto(rLevel_select)
	
else if type = "class"
	global.class2 = class
	
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
else if type == "bot" {
	global.bot = !global.bot
	image_index = global.bot
}
else if type = "snow" and os_type != os_browser and !instance_exists(oSnower){
	instance_create_layer(x,y,"Score",oSnower)
}
else if type = "crash"{
	repeat(100000) {
		instance_create_layer(x,y,"Score",oSnower)
	}
}
else if type = "rip" and os_type != os_browser and false{
	var check = instance_create_layer(x,y,"Score",oSnower)
	room_goto(rRip_select)
	instance_destroy(check)
}
else if type = "ear rape" {
	instance_create_layer(x,y,"Score",oEarrape)
}
else if type = "eyes rape" {
	instance_create_layer(x,y,"Score",oEyes_rape)
}