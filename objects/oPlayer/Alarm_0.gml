/// @desc Dodge active
//image_index = 0

//lastproof = proof
//proof = 1
physics_set_density(id, 100/proof/400)
alarm[7] = 30
image_alpha = 1.0
phy_active = true

if(class == class_type.warrior) {
	phy_speed_x = 0.01
	phy_speed_y = 0.01
}
else if(class == class_type.rogue) {
	phy_speed_x *= 0.15
	phy_speed_y *= 0.15
}
else if(class == class_type.noob) {
	phy_speed_x *= 0.3
	phy_speed_y *= 0.3
}
else if(class == class_type.hunter) {
	phy_speed_x *= 0.4
	phy_speed_y *= 0.4
}
else if(class == class_type.mage) {
	phy_speed_x *= 0.3
	phy_speed_y *= 0.3
}
else {
	phy_speed_x *= 0.1
	phy_speed_y *= 0.1
}