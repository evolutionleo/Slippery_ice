/// @desc
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(f0)
//draw_set_color(make_color_rgb(255,0,255))
//draw_set_color(c_lime)
//draw_set_color(c_white)
//draw_set_color(c_black)
//draw_set_color(make_color_rgb(240,240,240))
draw_set_color(make_color_rgb(40,40,40))

//sprite_index = sButton2
//if(os_type == os_browser) {
//	image_index = sButton2
//}
//else {
	draw_self()
//}

if type = "Select level"
	draw_text(x,y,"Select map")
else if type = "room"
	draw_text(x,y,room_get_name(target_room))
else if type == "class" {
	draw_text(x,y,string(class_name))
	if(global.class == class) {
		active = true
		draw_set_color(c_blue)
		draw_set_halign(fa_right)
		draw_text(bbox_left - 3,y,"P1")
	}
	if(global.class2 == class) {
		active = true
		draw_set_color(c_red)
		draw_set_halign(fa_left)
		draw_text(bbox_right + 3,y,"P2")
	}
	else if(global.class = class){
		active = false
	}
	//image_index = active
}
else if type = "Select class" {
	draw_text(x,y,"Select class")
}
else if type = "exit" {
	sprite_index = sButton_exit
}

