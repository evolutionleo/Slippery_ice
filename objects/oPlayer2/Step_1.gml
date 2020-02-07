/// @desc
if(global.bot) {
	kright = false
	kleft = false
	kdodge = false
	kabil = false
	ai_calculate_inputs(class, 1)
}
else {
	kright = keyboard_check(vk_right)		or gamepad_button_check(4,gp_padr)
	kleft = keyboard_check(vk_left)			or gamepad_button_check(4,gp_padl)
	kdodge = keyboard_check_pressed(vk_down)or gamepad_button_check(4,gp_padd)			or gamepad_button_check(4,gp_face1)
	kabil = keyboard_check_pressed(vk_up)	or gamepad_button_check_pressed(4,gp_padu)	or gamepad_button_check_pressed(4,gp_face2)
}

if(alarm[2] > 0 and class == class_type.rogue) {
	kdodge = keyboard_check(vk_down)	or gamepad_button_check(4,gp_padd)	or gamepad_button_check(4,gp_face1)
}

xx = phy_position_x
yy = phy_position_y

