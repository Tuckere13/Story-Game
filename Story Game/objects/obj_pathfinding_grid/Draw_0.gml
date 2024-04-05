

//(collision_rectangle(_x-16, _y-16, _x+16, _y+16, obj_invis_wall,true,true)


for (var _i = 0; _i < room_height/32; _i++){
	for (var _j = 0; _j < room_width/32; _j++){
		
		var _coords = global.room_grid_coords[_i][_j];
		var _x = _coords[0];
		var _y = _coords[1];
		var _distance_value = _coords[2];
		var _tile_number = _coords[3];
		
		var _inst = collision_rectangle(_x-16, _y-16, _x+16, _y+16, obj_invis_wall,false,true)
		
		if(!_inst){
			draw_set_color(c_green);
			//draw_circle(_x, _y, 5, true);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(_x, _y, _distance_value);
		} else {
			draw_set_color(c_red);
			draw_circle(_x, _y, 5, true);
		}
	}
}