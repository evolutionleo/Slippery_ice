/// @desc Sudden death!
if(room >= Flat) {
	with(oSnower) {
		max_snow_spd = 7
		part_type_sprite(part_ind,sSnow,false,false,false)
		part_type_size(part_ind, 1, 4, 0, 0)
		part_type_scale(part_ind, 1, 1)
		part_type_colour1(part_ind, c_white)
		part_type_speed(part_ind, 2, max_snow_spd, 0, 0)
		part_type_direction(part_ind, 45, 135, 0, 0)
		part_type_gravity(part_ind, 0.20, 270)
		//part_type_orientation(part_ind, 0, 0, 0, 0, 1)
		//part_type_blend(part_ind, 1)
		part_type_life(part_ind, 400, 500)
	}
	create_effect("flash",c_white)
}