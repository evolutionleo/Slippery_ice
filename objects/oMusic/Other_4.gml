/// @desc
//if(room < Flat) {
//	audio_stop_sound(aLevelMusic)
//	if(!audio_is_playing(aMenuMusic))
//		audio_play_sound(aMenuMusic,1,true)
//}
//else {
//	audio_stop_sound(aMenuMusic)
//	if(!audio_is_playing(aLevelMusic))
//		audio_play_sound(aLevelMusic,1,true)
//}
if(!audio_is_playing(aMenuMusic))
	audio_play_sound(aMenuMusic,1,true)