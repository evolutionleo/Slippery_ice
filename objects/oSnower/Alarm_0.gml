/// @desc
alarm[0] = delay
repeat(count) {
	var xx = random_range(0,room_width)
	var yy = random_range(-50,-10)
	var snow = instance_create_layer(xx,yy,"Snow",oSnow)
	//snow.direction = 45
	//snow.speed = 40
}