extends Skeleton2D

#@export var physics_mod:SkeletonModification2DPhysicalBones;
var physics_mod:SkeletonModification2DPhysicalBones;

var is_simulating = false;

func _ready():
	physics_mod = get_modification_stack().get_modification(0) as SkeletonModification2DPhysicalBones;

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		if (is_simulating == false):
			physics_mod.start_simulation();
			is_simulating = true;
		else:
			physics_mod.stop_simulation();
			is_simulating = false;
