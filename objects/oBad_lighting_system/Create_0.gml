/// @desc The whole screen of black pixels
layer_create(-10000,"Dark")
for (var xx = 0; xx < room_width; xx++) {
	for(var yy = 0; yy < room_height; yy++) {
		instance_create_layer(xx,yy,"Dark",oBad_light)
	}
}