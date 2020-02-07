/// @desc
if(other.my != id) {
	var value = damage / 12 * abs(other.phy_speed_x) * sign(phy_position_x - other.phy_position_x)
	var yvalue = other.phy_speed_y * 1
	physics_apply_impulse(other.phy_position_x,other.phy_position_y,value,yvalue)
	instance_destroy(other)
}
