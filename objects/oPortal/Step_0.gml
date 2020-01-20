/// @desc

pair = noone
with(oPortal) {
	if(image_index == !other.image_index and group == other.group) {
		other.pair = id
		pair = other
	}
}

tp = instance_place(x,y,oSolid)
if(tp != noone and image_index == 1) {
	deltax = phy_position_x - tp.phy_position_x
	deltay = phy_position_y - tp.phy_position_y
	//if(reverse or pair.reverse) {
		//tp.phy_position_x = pair.phy_position_x - deltax
		//tp.phy_position_y = pair.phy_position_y - deltay
		//tp.phy_speed_x = -tp.phy_speed_x
		//tp.phy_linear_velocity_x *= -tp.phy_linear_velocity_x
		//tp.phy_linear_velocity_y *= -1
	//}
	//else {
		tp.phy_position_x = pair.phy_position_x + deltax
		tp.phy_position_y = pair.phy_position_y - deltay
	//}
}