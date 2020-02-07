/// @desc
global.connectip = "127.0.0.1"
global.player_name = "Noob#025921"

client = network_create_socket(network_socket_tcp)
// Connect to our server
var err = network_connect(client, global.connectip, 5050);
if(err) {
	// if we can't connect, show the error and restart
	show_message("Error - can't connect to server!!");
	game_restart();
}

buffer = buffer_create(256,buffer_fast, 1)
send_class()
send_name()

