/// @desc
var buff = id.buff
buffer_seek(buff,buffer_seek_start,0)
with(all) {
	if(is_local) {
		buffer_write(buff,buffer_u16,object_index)
		buffer_write(buff,buffer_u16,sprite_index)
		buffer_write(buff,buffer_u16,image_index)
		buffer_write(buff,buffer_f16,phy_position_x)
		buffer_write(buff,buffer_f16,phy_position_y)
		buffer_write(buff,buffer_f16,phy_rotation)
		buffer_write(buff,buffer_f16,phy_speed_x)
		buffer_write(buff,buffer_f16,phy_speed_y)
		buffer_write(buff,buffer_f16,phy_angular_velocity)
		buffer_write(buff,buffer_u16,physics_get_density(id))
		buffer_write(buff,buffer_u16,physics_get_restitution(id))
		
	}
}