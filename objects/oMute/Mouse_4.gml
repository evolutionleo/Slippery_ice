/// @desc
global.mute = !global.mute
if(os_type != os_browser)
	image_index = global.mute
with(oMusic) {
	if(global.mute) {
		audio_pause_all()
	}
	else {
		audio_resume_all()
	}
}