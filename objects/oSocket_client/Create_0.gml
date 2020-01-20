with(all) {
	if(object_index == oPlayer or object_index == oSnowball)
		is_local = true
}

client = network_create_socket(network_socket_tcp);
network_connect_raw(client, "62.113.112.109/server.py", 5050);
//network_connect_raw(client, "127.0.0.1", 5050);
buff = buffer_create(2048,buffer_fixed,1)