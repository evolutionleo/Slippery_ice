/// @desc
switch(type) {
	case light.circle:
		with(oBad_light) {
			if(distance_to_object(other) < other.range) {
				visible = false
			}
			else {
				visible = true
			}
		}
		
		break
	case light.line:
		//Not supported yet
		break
	case light.square:
		with(oBad_light) {
			if(x < other.x + other.range and x > other.x - range
				and y < other.y - range and y > other.y + range) {
				visible = false
			}
			else {
				visible = true
			}
		}
		break
}
