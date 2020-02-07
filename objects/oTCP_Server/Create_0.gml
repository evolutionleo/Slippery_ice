/// @desc
global.server_type = network_socket_tcp

broadcast_buffer = buffer_create(32, buffer_fixed, 1)
player_buffer = buffer_create(16384, buffer_fixed, 1)

Clients = ds_map_create();
socketlist = ds_list_create();

// Try and create the actual server
server = network_create_server(global.server_type, 6510, 32);
if server < 0
{    
// If theres already a server running, shut down and delete.
ds_map_destroy(Clients);
ds_list_destroy(socketlist);
buffer_delete(broadcast_buffer);
buffer_delete(player_buffer);
instance_destroy();
}

alarm[0] = room_speed //Broadcast