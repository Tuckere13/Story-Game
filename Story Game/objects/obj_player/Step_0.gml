/// @description


//////////////// Movement ////////////////////////
reset_variables();

get_input();

calc_movement();


/////////////// Collision /////////////////////////




//////////////// Shooting ////////////////////////////


if(can_shoot == true) {
	if(keyboard_check(vk_space)){
		instance_create_layer(x+10, y, "Projectiles", obj_axe);
		can_shoot = false;
		alarm[0] = shoot_timer;
	}
	
}



















/*
if (can_shoot == true){
	if (keyboard_check(vk_up)){
		instance_create_layer(x, y, "Projectiles", obj_bullet_up);
		can_shoot = false;
		alarm[0] = shoot_timer;
	}
	else if (keyboard_check(vk_left)){
		instance_create_layer(x, y, "Projectiles", obj_bullet_left);
		can_shoot = false;
		alarm[0] = shoot_timer;
	}
	else if (keyboard_check(vk_down)){
		instance_create_layer(x, y, "Projectiles", obj_bullet_down);
		can_shoot = false;
		alarm[0] = shoot_timer;
	}
	else if (keyboard_check(vk_right)){
		instance_create_layer(x, y, "Projectiles", obj_bullet_right);
		can_shoot = false;
		alarm[0] = shoot_timer;
	}
}
*/

//////////////// Add Attack ////////////////////////////

if (adding_attack == true){
	event_user(1);
	adding_attack = false;
}
///////////////// Add Speed /////////////////////////////
if (adding_speed == true){
	event_user(1);
	adding_speed = false;
}
//////////////// Add Luck ////////////////////////////////
if (adding_luck == true){
	event_user(1);
	adding_luck = false;
}
//////////////// Add Attack Health ///////////////////////
if (adding_health = true){
	event_user(1);
	adding_health = false;
}



if(hearts = 0) and (armor_hearts = 0) {
	
	sprite_index = spr_player_dead;
	move_speed = 0;
	
	dying = true;
	if (dying = true){
		alarm[1] = 240;
	}
	dying = false;
	
	
}






