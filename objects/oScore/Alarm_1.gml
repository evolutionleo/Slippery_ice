/// @desc
var map = ds_map_create()
//result = score1 > 5 ? "win" : "loss"
if(score1 > 5) {
	if(score2 > 5 and score2 < score1) {
		score1 += 1
	}
	else if(score2 > 5 and score2 > score1) {
		score2 += 1
	}
	else {
		score1 += 1
	}
}
else
	score2 += 1

//http_request("62.113.112.109/index.php/?action=game_end&security="+global.ssh+"&name="+global.name+"&opponent_name="+global.opponent_name+"&result="+result,"GET",map,"")
ds_map_destroy(map)
room_goto(rMenu)