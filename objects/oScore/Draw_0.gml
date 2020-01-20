/// @desc
if(room >= Flat)
{
	if(alarm[1] <= 0)
	{
		draw_set_font(fScore)
		draw_set_color(c_blue)
		draw_set_halign(fa_right)
		draw_set_valign(fa_middle)
		draw_text(room_width/2,60,string(score1)+" ")
		
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_text(room_width/2,60,":")
		
		draw_set_color(c_red)
		draw_set_halign(fa_left)
		draw_text(room_width/2,60," "+string(score2))
	}
	else
	{
		draw_set_font(fWin)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		if(score1 > 5 and score1 == score2) {
			draw_set_color(c_ltgray)
			draw_text(room_width/2,room_height/2,"Draw!")
		}
		if(score1 > 5 and score1 > score2) {
			draw_set_color(c_blue)
			draw_text(room_width/2,room_height/2,"Player 1 Won!")
		}
		else if(score2 > 5 and score2 > score1) {
			draw_set_color(c_red)
			draw_text(room_width/2,room_height/2,"Player 2 Won!")
		}
	}
}
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)