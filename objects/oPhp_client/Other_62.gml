/// @desc
if async_load[? "status"] == 0 {
	var json = async_load[? "result"]
	var map = json_decode(json)
	var action = map[? "action"]
	if action == "login_response"
	{
		var msg = map[? "message"]
		if(msg == "wrong password" or msg == "failed to create") {
			global.online = false
			room_goto(rSplash)
		}
		else if(msg == "success" or msg == "created") {
			global.online = true
			room_goto(rMenu)
		}
		show_message(msg)
	}
	else if action == "search_response"
	{
		global.opponent_name = map[? "opponent_name"]
		instance_create_layer(x,y,layer,oPost_client)
	}
}