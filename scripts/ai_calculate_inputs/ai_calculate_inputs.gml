var _x = phy_position_x
var _y = phy_position_y
var hsp = phy_speed_x + phy_linear_velocity_x
var vsp = phy_speed_y + phy_linear_velocity_y
var not_dodging = alarm[0] <= 0

var difficulty = argument1

//var opp = instance_nearest(_x,_y,oPlayer)
var opp = instance_furthest(_x,_y,oPlayer)
var ox = opp.phy_position_x
var oy = opp.phy_position_y
var ohsp = opp.phy_speed_x + opp.phy_linear_velocity_x
var ovsp = opp.phy_speed_y + opp.phy_linear_velocity_y
//var angle = opp.phy_rotation

//var maxspd = spd * room_speed / 2
var maxspd = room_width - _x * difficulty
var minspd = -_x / difficulty

//var input_array = []
var class = argument0

//var kright = false, kleft = false, kabil = false, kdodge = false

var ox1 = ox + ohsp - hsp
var oy1 = oy + ovsp - vsp

var x1 = _x + hsp
var y1 = _y + vsp

var colliding = false

if(opp.phy_active and distance_to_point(ox1,oy1) < 256)
	colliding = true

var bbr = bbox_right - _x + x1
var bbt = bbox_top - _y + y1
var bbl = bbox_left - _x + x1
var bbb = bbox_bottom - _y + y1

if(colliding and hsp < ohsp) or outside_room(bbr,bbl,bbt,bbb){
	//Хорошо бы уклоняться в идеальный момент (ровно в пооследний фрейм)
	kdodge = true
	dir = sign(ox - _x)
}
if(hsp > maxspd or hsp < minspd) {
	//Нельзя набирать слишком большую скорость, иначе можно вылететь за карту от одного уворота
	//"Слишком большая скорость" зависит от характеристик и расстояния от края карты (см maxspd)
	dir = -sign(hsp)
}
else { //В целом выгодно всегда двигаться в сторону противника, кроме случаев выше
	dir = sign(ox - _x)
}

if(dir == 1) {
	kright = true
	kleft = false
}
else if(dir == -1) {
	kright = false
	kleft = true
}
else {
	kright = false
	kleft = false
}

//Определяем, какие ульты надо нажать

if(not_dodging) {
	
	if(colliding) and class == class_type.hunter {
		kabil = true
	}
	if(kright - kleft) == dir and class == class_type.mage {
		kabil = true
	}
	if kdodge and alarm[1] > 0 and class == class_type.rogue {
		kabil = true
	}
	if(colliding and hsp < ohsp) and class == class_type.warrior {
		kabil = true
	}
}

//Не прерываемся посреди доджа

if(!not_dodging) {
	if(kdodge and class == class_type.rogue and alarm[2] > 0)
		kdodge = true
	else
		kdodge = false
}

//input_array = [kright, kleft, kdodge, kabil]
//return input_array