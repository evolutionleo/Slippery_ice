type = argument0
///@arg effect_type (string)
///@arg color
	var c = argument1

if(!layer_exists("Effects"))
	layer_create(-10000,"Effects")
if(type == "flash") {
	var eff = instance_create_layer(x,y,"Effects",oFlash_effect)
	eff.color = c
}