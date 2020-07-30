extends RigidBody2D

export (float) var SPEED = 400;

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if (global_position.distance_to(get_global_mouse_position()) > 4):
		var direction = global_position.direction_to(get_global_mouse_position());
		linear_velocity = direction * SPEED;
	else:
		linear_velocity = Vector2.ZERO;
	
	angular_velocity = 0;
	rotation = 0;
