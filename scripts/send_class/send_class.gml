///@desc Send info about our class to the server

buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, CMD_CLASS)
buffer_write(buffer, buffer_u8, global.class)

var size = buffer_tell(buffer)
network_send_packet(client, buffer, size)