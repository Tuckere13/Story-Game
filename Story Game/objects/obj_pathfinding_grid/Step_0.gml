

if (search){
	search = false;
	global.room_grid_coords = create_room_coords();
	
	show_debug_message("pathing");
	alarm[0]= 60;
}