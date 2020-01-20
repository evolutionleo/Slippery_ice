/// @desc

//if(phy_rotation > 45 and phy_rotation < 135 or phy_rotation > 225 and phy_rotation < 315)
//{
//	var scale_name = "image_yscale"
//	var scale = image_yscale
//}
//else
//{
	var scale_name = "image_xscale"
	var scale = image_xscale
//}

if(physics_test_overlap(phy_position_x,phy_position_y+1,phy_rotation,oWall))
{
	if(kleft)
	{
		physics_apply_force(phy_position_x,phy_position_y,-spd,0)
		if(scale > 0)
			variable_instance_set(id,scale_name,scale*-1)
	}
	else if(kright)
	{
		physics_apply_force(phy_position_x,phy_position_y,spd,0)
		if(scale < 0)
			variable_instance_set(id,scale_name,scale*-1)
	}
}
else {
	if(kleft)
	{
		physics_apply_force(phy_position_x,phy_position_y,-spd/4,0)
		if(scale > 0)
			variable_instance_set(id,scale_name,scale*-1)
	}
	else if(kright)
	{
		physics_apply_force(phy_position_x,phy_position_y,spd/4,0)
		if(scale < 0)
			variable_instance_set(id,scale_name,scale*-1)
	}
}


if(physics_test_overlap(phy_position_x,phy_position_y+1,phy_rotation,oSolid))
{
	if(image_alpha == 1.0)
	{
		
		if(kdodge and alarm[1] <= 0)
		{
			// image_index = 1
			image_alpha = 94/255
			phy_active = false
			alarm[0]	= dodge_duration
			alarm[1]	= dodge_cooldown
		}
		if(kabil and alarm[3] <= 0)
		{
			switch(class)
			{
				case class_type.mage:
					 image_index = 1
					var xxx = lengthdir_x(sign(image_xscale)*10,phy_rotation)
					var yyy = lengthdir_y(-10,phy_rotation)
					with(instance_create_layer(x+xxx,y+yyy,"Bullets",oSnowball)) {
						physics_apply_impulse(x,y,150*sign(other.image_xscale),-20)
						my = other
						xx = phy_position_x
						yy = phy_position_y
					}
					alarm[3] = 90
					break
				case class_type.rogue:
					//image_blend = c_ltgray
					 image_index = 1
					dodge_cooldown = 0
					dodge_duration = 1
					alarm[1] = 1
					alarm[2] = 120
					alarm[3] = 540
					//my_smoke = instance_create_layer(x,y,"Bullets",oSmoke)
					//my_smoke.image_xscale = image_xscale
					//my_smoke.image_yscale = image_yscale
					break
				case class_type.hunter:
					damage *= 10
					//image_blend = c_green
					 image_index = 1
					alarm[0] = 1
					alarm[2] = 45
					alarm[3] = 540
					break
				case class_type.warrior:
					proof = 1
					//image_blend = c_gray
					 image_index = 1
					alarm[0] = 1
					alarm[2] = 120
					alarm[3] = 540
					physics_set_density(id, 100/proof/4)
					break
				//case class_type.noob:
				//	image_blend = c_aqua
				//	alarm[2] = 90
				//	alarm[3] = 120
				//	proof -= 5
				//	damage += 5
				//	spd += 10
				//	dodge_duration += 5
				//	dodge_cooldown += 5
			}
		}
	}
	else if(kdodge)
	{
		if(alarm[0] != 1)
			alarm[0] = 1
	}
	#region //Collision checking
	//var xx = phy_position_x
	//var yy = phy_position_y
	//var rot = phy_rotation
	//if(physics_test_overlap(xx,yy,rot,oPlayer)) {
	//	with(other) {
	//		physics_apply_impulse(x,y,sign(x-other.x)*200,-30)
	//	}
	//}
	#endregion
}