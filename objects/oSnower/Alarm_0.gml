/// @desc
alarm[0] = delay
repeat(count) {
	var xx = random_range(0,room_width)
	var yy = random_range(-50,-10)
	//var snow = instance_create_layer(xx,yy,"Snow",oSnow)
	part_particles_create(part_sys,xx,yy,part_ind,1)
	//snow.direction = 45
	//snow.speed = 40
}