/// @function		ServerReceivedData();
/// @description	Read incoming data to the server from a connected socket

// get the buffer the data resides in
var buff = async_load[? "buffer"];
// read ythe command 
var cmd = buffer_read(buff, buffer_u8);
// Get the socket ID - this is the CLIENT socket ID. We can use this as a "key" for this client
var sock = async_load[? "id"];
// Look up the client details
var inst = Clients[? sock];
// Is this a KEY command?
if cmd == CMD_KEY
{
    // Read the key that was sent
    var key = buffer_read(buff, buffer_u8 );
    // And it's up/down state
    var updown = buffer_read(buff, buffer_u8 );
    // translate keypress into an index for our player array.
    if key == ord("A")
	{
        inst.kleft = updown
	}
    else if key == ord("D")
	{
        inst.kright = updown
	}
    else if key == ord("S")
	{
		inst.kdodge = updown
	}
    else if key == ord("W")
	{
        inst.kabil = updown
	}
}
// Is this a NAME command?
else if cmd == CMD_NAME    
{
    // Set the client "name"
    inst.PlayerName = buffer_read(buff, buffer_string);    
}
else if cmd == CMD_CLASS
{
	inst.class = buffer_read(buff, buffer_u8)
}
//else if cmd == PING_CMD
//{
//    // keep alive - ignore it
//}



