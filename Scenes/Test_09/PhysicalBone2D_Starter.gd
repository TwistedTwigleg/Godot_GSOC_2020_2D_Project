extends Skeleton2D

export (SkeletonModification2DPhysicalBones) var physics_mod : SkeletonModification2DPhysicalBones;

var is_simulating = false;

func _ready():
	pass;

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		if (is_simulating == false):
			physics_mod.start_simulation();
			is_simulating = true;
		else:
			physics_mod.stop_simulation();
			is_simulating = false;
