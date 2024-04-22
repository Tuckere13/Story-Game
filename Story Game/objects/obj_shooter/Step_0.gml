

if (can_shoot) {
	instance_create_layer(x, y, "Projectiles", obj_shooter_projectile);
	
	can_shoot = false;
	alarm[0] = 90;
}