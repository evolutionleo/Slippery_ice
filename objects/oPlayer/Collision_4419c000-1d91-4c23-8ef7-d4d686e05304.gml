/// @desc

if(alarm[9] <= 0 and alarm[7] <= 0)
{
	if(sign(phy_speed_x) != sign(other.phy_speed_x) or other.phy_speed_x > 2)
	{
		var dir		= sign(x - other.x)
		var per		= proof								/ 100
		var xvalue	= per	* other.damage		* dir	* 1
		var yvalue	= per	* other.damage		* dir	/ 10
		
		var per2	= other.proof						/ 100
		var xvalue2	= per2	* damage			* -dir	* 1
		var yvalue2	= per2	* damage			* -dir	/ 10
		
		physics_apply_impulse(x,y,xvalue,yvalue)
		with(other)
		{
			physics_apply_impulse(x,y,xvalue2,yvalue2)
		}
	}
	alarm[9] = 2
}