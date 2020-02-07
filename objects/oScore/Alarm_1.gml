/// @desc Return to menu
var map = ds_map_create()
//result = score1 > 5 ? "win" : "loss"
if(score1 > 5) {
	if(score2 > 5 and score2 < score1) {
		score1 += 1
	}
	else if(score2 > 5 and score2 > score1) {
		score2 += 1
	}
	else {
		score1 += 1
	}
}
else
	score2 += 1


with(oSnower) {
	max_snow_spd = 4
	part_type_sprite(part_ind,sSnow,false,false,false)
	part_type_size(part_ind, 1, 4, 0, 0)
	part_type_scale(part_ind, 1, 1)
	part_type_colour1(part_ind, c_white)
	part_type_speed(part_ind, 1, max_snow_spd, 0, 0)
	part_type_direction(part_ind, 45, 135, 0, 0)
	part_type_gravity(part_ind, 0.20, 270)
	//part_type_orientation(part_ind, 0, 0, 0, 0, 1)
	//part_type_blend(part_ind, 1)
	part_type_life(part_ind, 400, 500)
}

//http_request("62.113.112.109/index.php/?action=game_end&security="+global.ssh+"&name="+global.name+"&opponent_name="+global.opponent_name+"&result="+result,"GET",map,"")
ds_map_destroy(map)
room_goto(rMenu)