extends Skeleton2D

export (SkeletonModification2DPhysicalBones) var physics_mod : SkeletonModification2DPhysicalBones;

var is_simulating = false;

func _ready():
	# Set using modification stack.
	"""
	var mod_stack = get_modification_stack();
	for mod_index in mod_stack.modification_count:
		var mod = mod_stack.get_modification(mod_index);
		if (mod is SkeletonModification2DPhysicalBones):
			mod.start_simulation([]);
	"""
	
	# Set using export
	#physics_mod.start_simulation();
	
	# Set using animation player
	# get_parent().get_node("AnimationPlayer").play("Physcs_Test");
	
	pass;

func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		if (is_simulating == false):
			physics_mod.start_simulation();
			is_simulating = true;
		else:
			physics_mod.stop_simulation();
			is_simulating = false;
