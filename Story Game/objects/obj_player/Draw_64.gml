

if (hearts > 0) {
	var _x_draw = 60;
	for(var _i = 0; _i < hearts; _i++) {
		
		draw_sprite(spr_heart, 1, _x_draw, 50)
		_x_draw += 60;
	}
}