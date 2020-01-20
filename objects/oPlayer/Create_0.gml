/// @desc
#region Calculate stats from class_type
dodge_duration = 40
dodge_cooldown = 240
spd = 500
proof = 100 //percentage of taking impulse
damage = 50

phy_bullet = true

//sprite_index = sPlayer
//image_blend = color
image_blend = c_white
//phy_fixed_rotation = true

//delta_mult = -1

//player = global.player

switch(class)
{
	case class_type.noob:
		dodge_duration = 40
		dodge_cooldown = 200
		spd = 1000
		damage = 150
		proof = 80
		//sprite_index = sPlayer
		//sprite_index = sSnegovik
		alarm[3] = 0
		break
	case class_type.warrior:
		dodge_duration = 25
		dodge_cooldown = 300
		spd = 800
		proof = 40
		damage = 160
		sprite_index = sWarrior
		//sprite_index = sSnegovik
		alarm[3] = 45
		break
	case class_type.rogue:
		dodge_duration = 50
		dodge_cooldown = 130
		spd = 1600
		proof = 160
		damage = 70
		sprite_index = sRogue
		//sprite_index = sSnegovik
		alarm[3] = 60
		break
	case class_type.hunter:
		dodge_duration = 50
		dodge_cooldown = 250
		spd = 1000
		proof = 140
		damage = 200
		sprite_index = sHunter
		//sprite_index = sSnegovik
		alarm[3] = 30
		break
	case class_type.mage:
		dodge_duration = 30
		dodge_cooldown = 200
		spd = 700
		proof = 130
		damage = 120
		sprite_index = sMage
		//sprite_index = sSnegovik
		alarm[3] = 10
		break
}
#endregion
#region //REALLY complex fixture

//physics_fixture_delete(id)

//var fixture = physics_fixture_create()
//physics_fixture_set_circle_shape(fixture,50)
//physics_fixture_set_density(fixture,0.5)
//physics_fixture_set_restitution(fixture,0.4)
//physics_fixture_set_linear_damping(fixture,0.02)
//physics_fixture_set_friction(fixture,0.2)
//physics_fixture_bind_ext(fixture,id,138,173)
//physics_fixture_delete(fixture)

//var fixture = physics_fixture_create()
//physics_fixture_set_circle_shape(fixture,33)
//physics_fixture_set_circle_shape(fixture,50)
//physics_fixture_set_density(fixture,0.5)
//physics_fixture_set_restitution(fixture,0.4)
//physics_fixture_set_linear_damping(fixture,0.02)
//physics_fixture_set_friction(fixture,0.2)
//physics_fixture_bind_ext(fixture,id,135,100)
//physics_fixture_delete(fixture)

//var fixture = physics_fixture_create()
//physics_fixture_set_circle_shape(fixture,22)
//physics_fixture_set_circle_shape(fixture,50)
//physics_fixture_set_density(fixture,0.5)
//physics_fixture_set_restitution(fixture,0.4)
//physics_fixture_set_linear_damping(fixture,0.02)
//physics_fixture_set_friction(fixture,0.2)
//physics_fixture_bind_ext(fixture,id,134,57)
//physics_fixture_delete(fixture)
#endregion
#region Additional stats setup

//spd *= 4
spd *= abs(image_xscale) * 4
damage *= 4

//physics_set_density(id, 100/proof/2)
physics_set_density(id, 100/proof/4)
physics_set_restitution(id,0.02*100/proof/abs(image_xscale))

//physics_fixture_bind(oPlayer,self)
//physics_set_restitution()
#endregion