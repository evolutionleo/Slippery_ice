/// @desc

var status = async_load[? "status"]
if(status == 0) {


var json = async_load[? "result"]
var temp1 = ds_map_create()

if(!is_undefined(json))
	temp1 = json_decode(json)


if(!is_undefined(json) and json != "{}" and !is_undefined(temp1[? "default"])) {


with(oSaveme) {
	if(player != global.player)
		instance_destroy()
}


var map = json_decode(json)

var p = map[? "p"]
var list = ds_list_create()
list = map[? "default"]
show_debug_message("RECIEVED DATA. TEXT: "+json)

//show_debug_message(ds_list_size(list))

for(var i = 0; i < ds_list_size(list); i++) {
	var cur_map = list[| i]
	var obj =		cur_map[? "o"]
	var spr =		cur_map[? "s"]
	var img =		cur_map[? "i"]
	var lay =		cur_map[? "l"]
	var xx =		cur_map[? "x"]
	var yy =		cur_map[? "y"]
	//var yscale =	cur_map[? "ys"]
	//var xscale =	cur_map[? "xs"]
	//var rot =		cur_map[? "r"]
	//var xspeed =	cur_map[? "sx"]
	//var yspeed =	cur_map[? "sy"]
	//var density =	cur_map[? "d"]
	//var rest =		cur_map[? "re"]
	//var xvelo =		cur_map[? "xv"]
	//var yvelo =		cur_map[? "yv"]
	//var avelo =		cur_map[? "av"]
	
	var inst = instance_create_layer(xx,yy,lay,obj)
	with(inst) {
		sprite_index =				spr
		image_index =				img
		//image_xscale =				xscale
		//image_yscale =				yscale
		//phy_rotation =				rot
		//phy_speed_x =				xspeed
		//phy_speed_y =				yspeed
		//physics_set_density(id,		density)
		//physics_set_restitution(id,	rest)
		//phy_angular_velocity =		avelo
		//phy_linear_velocity_x =		xvelo
		//phy_linear_velocity_y =		yvelo
		player = p
	}
}

}

}