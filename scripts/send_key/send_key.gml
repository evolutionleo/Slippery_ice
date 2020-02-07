///@desc Send a key press/release to a server
///@arg key
///@arg value
var key = argument0
var value = argument1

buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, CMD_KEY)
buffer_write(buffer, buffer_u8, key)
buffer_write(buffer, buffer_u8, value)

var size = buffer_tell(buffer)
network_send_packet(client, buffer, size)