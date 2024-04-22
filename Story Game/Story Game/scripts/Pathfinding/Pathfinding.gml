// Pathfinding for Enemies

function pathfind(){
	
	// first: calculate the distance from player and assign value to each coordinate
		//1. figure out where player is
		//2. calculate number with equation? or maybe just loop it until position is reached
	// second: choose highest value
	// third: move
	
	//generate_distance_values()
	
	
	
	
	
	
}


function generate_distance_values(_room_tiles) {
	// find player
	// returns the index of the array (_room_tiles) the player is currently touching
	var _indexes = find_player(_room_tiles); 
	
	var _i = _indexes[0];
	var _j = _indexes[1];
	
	var _coords = _room_tiles[_indexes[0]][_indexes[1]];
	var _distance_value = _coords[2] = 1;
	_room_tiles[_indexes[0]][_indexes[1]] = _coords;
	
	var _previous_distance = 1;
	
	//var _tile_number = _coords[3];
	
	//for (var _left_side_tiles = 0; _left_side_tiles < )
	
	var _left_side_length = obj_player.x / 32;
	var _down_side_length = (obj_player.y - room_height) / 32;
	var _tiles_traveled = 1;
	
	while (true) {
		
		
		
		
		var _coords_down = _room_tiles[_i + _tiles_traveled][_j];
		var _distance_value_down = _coords_down[2];
		
		var _coords_left = _room_tiles[_i][_j - _tiles_traveled];
		var _distance_value_left = _coords_left[2];
		
		//var _coords_right = _room_tiles[_i][_j+1];
		//var _distance_value_right = _coords_right[2];
		
		//var _coords_up = _room_tiles[_i-1][_j];
		//var _distance_value_up = _coords_up[2];
		
		
		
		if (_down_side_length > _tiles_traveled){
			if (_distance_value_down == 0) {
				//;
			} else if (_distance_value_left == 0) {
				_j--;
			}else {
				_i = _indexes[0];
				_j = _indexes[1];
				_previous_distance = 1;
			}
		}
    
	_previous_distance += 1;
    _coords = _room_tiles[_i][_j];
    _coords[2] = _previous_distance;
    _room_tiles[_i][_j] = _coords;
	
	_tiles_traveled++;
	
	// need a break line **********
	}
	return _room_tiles;
	
}
	
	
	
	/*
		if (_i == _indexes[0] and _j == _indexes[1]) {
			var _coords_down = _room_tiles[_indexes[0]+1][_indexes[1]];
			var _distance_value_down = _coords_down[2];
		
			var _coords_left = _room_tiles[_indexes[0]][_indexes[1]-1];
			var _distance_value_left = _coords_left[2];
		
			
			var _coords_right = _room_tiles[_indexes[0]][_indexes[1]+1];
			var _distance_value_right = _coords_right[2];
			
			var _coords_up = _room_tiles[_indexes[0]-1][_indexes[1]];
			var _distance_value_up = _coords_up[2];
			
			
			if (_distance_value_down > 0 and _distance_value_left > 0){
				break;
			} 
			
			
		}
		*/



function find_player(_room_tiles){
	
	for (var _i = 0; _i< room_height/32; _i++)
	{
		for (var _j = 0; _j< room_width/32; _j++)
		{
			
			var _coords = _room_tiles[_i][_j];
			var _x = _coords[0];
			var _y = _coords[1];
			//var _distance_value = _coords[2];
			//var _tile_number = _coords[3];
			
			var _inst = collision_rectangle(_x-16, _y-16, _x+16, _y+16, obj_pathfind_point, false, true);
			
			if(_inst) // if player is in that position
			{
				var _indexes = array_create(2);
				_indexes[0] = _i;
				_indexes[1] = _j;
				return _indexes;
			}
		}
	}
}


// Fill the current rooms coordinate array with all 0s
//
// Returns: // Returns: 2D array of arrays all filled with 0s
function fill_array(_room_tiles, _room_tile_w, _room_tile_h){
	for (var _i = 0; _i < _room_tile_w; _i++) {
		for (var _j = 0; _j < _room_tile_h; _j++) {
			_room_tiles[_i, _j] = [0, 0];
		}
	}
	
	return _room_tiles;
}

// Set the coordinates for the current room to all be 32 pixels apart from each other
//
// Returns: 2D array of arrays that are filled with [x coord, y coord, -1(initial distance value), tile number]
function set_coordinates(_room_tiles, _room_tile_w, _room_tile_h){
    var _y_coord = 0;
    var _previous_x = 0;
	var _tile_number = 1;

    for(var _i = 0; _i < _room_tile_h; _i++){
        for(var _j = 0; _j < _room_tile_w; _j++){
			
            if (_j == 0){
                _previous_x = -32;
            }
			else {
                var _previous_coords = _room_tiles[_i][_j - 1];
                _previous_x = _previous_coords[0];
            }
			
			var _new_coords = [_previous_x + 32, _y_coord, 0, _tile_number]; // if nothing tile distance is set to be 0 to start
			
			
			var _inst = collision_rectangle(_new_coords[0]-16, _new_coords[1]-16, _new_coords[0]+16, _new_coords[1]+16, obj_invis_wall, false, true)
			
			if (_inst){
				_new_coords = [_previous_x + 32, _y_coord, -1, _tile_number]; // if wall tile distance is -1
			}
			
			_room_tiles[_i][_j] = _new_coords;
			_tile_number++;
        }
        _y_coord += 32;
    }
	
    return _room_tiles;
}

// Function called when a room is created, creates and fill the room coordinate array
// with the correct coordinates
//
// Returns: 2D array of arrays that are filled with [x coord, y coord, 1000(initial distance value)]
function create_room_coords(){ // this function should be called once every time a room is loaded in
	
	var _room_tile_w = room_width/32;  // need to make all rooms work with this
	var _room_tile_h = room_height/32;
	
	// create array
	room_tiles = array_create(_room_tile_w, _room_tile_h);
	
	// fill with 0s
	room_tiles = fill_array(room_tiles, _room_tile_w, _room_tile_h);
	
	// set coordinates according to room size
	room_tiles = set_coordinates(room_tiles, _room_tile_w, _room_tile_h);
	
	room_tiles = generate_distance_values(room_tiles)
	
	return room_tiles;
	
}