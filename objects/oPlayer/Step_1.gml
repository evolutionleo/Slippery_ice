/// @desc
kright = keyboard_check(ord("D"))
kleft = keyboard_check(ord("A"))
kdodge = keyboard_check_pressed(ord("S"))
kabil = keyboard_check_pressed(ord("W"))

if(alarm[2] > 0 and class == class_type.rogue) {
	kdodge = keyboard_check(ord("S"))
}

xx = phy_position_x
yy = phy_position_y