/// @desc
global.mute = !global.mute
//if(os_type != os_browser)
image_index = global.mute
with(oMusic) {
	if(global.mute and !instance_exists(oEarrape)) {
		audio_pause_all()
	}
	else {
		audio_resume_all()
	}
}