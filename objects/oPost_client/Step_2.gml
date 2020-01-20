/// @desc
var list = ds_list_create()
with(oSaveme) {
	if(player == global.player) {
		var my_map = ds_map_create()
		ds_map_add(my_map,"o", object_index)
		ds_map_add(my_map,"s", sprite_index)
		ds_map_add(my_map,"i", image_index)
		ds_map_add(my_map,"ys",image_yscale)
		ds_map_add(my_map,"xs",image_xscale)
		ds_map_add(my_map,"l", layer_get_name(layer))
		ds_map_add(my_map,"x", phy_position_x)
		ds_map_add(my_map,"y", phy_position_y)
		ds_map_add(my_map,"r", phy_rotation)
		ds_map_add(my_map,"sx",phy_speed_x)
		ds_map_add(my_map,"sy",phy_speed_y)
		ds_map_add(my_map,"av",phy_angular_velocity)
		ds_map_add(my_map,"xv",phy_linear_velocity_x)
		ds_map_add(my_map,"yv",phy_linear_velocity_y)
		ds_map_add(my_map,"d", physics_get_density(id))
		ds_map_add(my_map,"re",physics_get_restitution(id))
		
		
		
		ds_list_add(list,my_map)
		ds_list_mark_as_map(list,ds_list_size(list)-1)
		
		//ds_list_add(list,json_encode(my_map))
		
		//list[array_length_1d(list)] = my_map
		
		//show_debug_message("Map: "+json_encode(my_map))
	}
}
		 
var map = ds_map_create()
ds_map_add_list(map,"default",list)
//ds_map_add(map,"default",list)
ds_map_add(map,"p",global.player)

var json = json_encode(map)
#region Optimize json string (delete zeros)
json = string_replace_all(json,"000000,",",")
json = string_replace_all(json,"000000 }"," }")
json = string_replace_all(json,"00000,",",")
json = string_replace_all(json,"00000 }"," }")
json = string_replace_all(json,"0000,",",")
json = string_replace_all(json,"0000 }"," }")
json = string_replace_all(json,"000,",",")
json = string_replace_all(json,"000 }"," }")
json = string_replace_all(json,"00,",",")
json = string_replace_all(json,"00 }"," }")
json = string_replace_all(json,"0,",",")
json = string_replace_all(json,"0 }"," }")
json = string_replace_all(json,".,",",")
json = string_replace_all(json,". }"," }")
#endregion

var header_map = ds_map_create()
ds_map_add(header_map,"Content-type","application/json")

//http_post_string("http://62.113.112.109:5050/realtime",json)
http_request("http://62.113.112.109:5050/realtime","POST",header_map, json)

show_debug_message("SENDING DATA. TEXT: "+json)