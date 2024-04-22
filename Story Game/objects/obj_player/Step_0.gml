/// @description


//////////////// Movement ////////////////////////
reset_variables();

get_input();

calc_movement();


//////////////// Player Direction ///////////////////////

direction = point_direction(x, y, mouse_x, mouse_y);

//////////////// Shooting ////////////////////////////


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


//////////////////////// Shielding /////////////////////

// Blocking drection will be chosen based off player mouse direction.
// if directly right then block right   (East)
// if up right then block up and right  (North East)

if (keyboard_check_direct(vk_shift)) {
	
	shielding = true;
	
	move_speed = 2;
	// Sides

	
	if (direction >= 337.5 and direction < 360) or (direction >= 0 and direction < 22.5) {    // East
		obj_player.sprite_index = spr_player_shield_east;
	}
	if (direction >= 67.5 and direction < 112.5) {           // North
		obj_player.sprite_index = spr_player_shield_north;
	}
	if (direction >= 157.5 and direction < 202.5) {           // West
		obj_player.sprite_index = spr_player_shield_west;
	}
	if (direction >= 247.5 and direction < 292.5) {           // South
		obj_player.sprite_index = spr_player_shield_south;
	}
	
	// Diagonals
	
	if (direction >= 22.5 and direction < 67.5) {           // North East
		obj_player.sprite_index = spr_player_shield_north_east;
	}
	if (direction >= 112.5 and direction < 157.5) {           // West
		obj_player.sprite_index = spr_player_shield_north_west;
	}
	if (direction >= 202.5 and direction < 247.5) {           // South
		obj_player.sprite_index = spr_player_shield_south_west;
	}
	if (direction >= 292.5 and direction < 337.5) {           // South
		obj_player.sprite_index = spr_player_shield_south_east;
	}
} else {
	sprite_index = spr_player;
	shielding = false;
	
	move_speed = 5;    // need to soft code this ***********************************************************************************************
} 








