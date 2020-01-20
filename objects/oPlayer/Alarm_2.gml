/// @desc Ability active
if(class == class_type.rogue) {
	//image_blend = c_white
	dodge_cooldown = 120
	dodge_duration = 50
	//if(os_type != os_browser) 
	image_index = 0
	if(alarm[0] <= 0)
		image_alpha = 1.0
	//instance_destroy(my_smoke)
}
else if(class == class_type.hunter) {
	//image_blend = c_white
	damage /= 10
	//if(os_type != os_browser)
	image_index = 0
}
else if(class == class_type.warrior) {
	//image_blend = c_white
	sprite_index = sWarrior
	proof = 60
	physics_set_density(id, 100/proof/2)
	//if(os_type != os_browser) 
	image_index = 0
}
else if(class == class_type.noob) {
	//image_blend = c_white
	//if(os_type != os_browser)
	image_index = 0
}
else if(class == class_type.mage) {
	//image_blend = c_white
	//if(os_type != os_browser) 
	image_index = 0
}