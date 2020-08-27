@tool
extends SkeletonModification2D
class_name SkeletonModification2DSpring

@export var bone_index:int = 0;

@export var path_to_target:NodePath;
var _target;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func execute(delta):
	if (enabled == false):
		return;
	
	if _target == null:
		_target = get_modification_stack().get_skeleton().get_node(path_to_target);
		if _target == null:
			return;
	
	var operation_bone = get_modification_stack().get_skeleton().get_bone(bone_index);
	if operation_bone == null:
		return;
	
	#var operation_transfrom:Transform2D = operation_bone.get_global_transform();
	var operation_transfrom:Transform2D = get_modification_stack().get_skeleton().get_bone_local_pose_override(bone_index);
	operation_transfrom = operation_bone.get_parent().global_transform * operation_transfrom;
	
	# Look at the target
	operation_transfrom = operation_transfrom.looking_at(_target.global_position);
	# account for the direction the bone faces in
	operation_transfrom.set_rotation(operation_transfrom.get_rotation() - operation_bone.get_bone_angle());
	
	# Stretch/Scale based on distance
	var distance_to_target = operation_bone.global_position.distance_to(_target.global_position);
	var scale_factor = distance_to_target / operation_bone.get_length();
	
	operation_bone.global_transform = operation_transfrom;
	operation_bone.scale = Vector2(1, 1) * scale_factor;
	
	get_modification_stack().get_skeleton().set_bone_local_pose_override(
		bone_index, operation_bone.transform, get_modification_stack().strength, true
	);
	
	for child_bone in operation_bone.get_children():
		if (child_bone is Bone2D):
			var child_index = child_bone.get_index_in_skeleton();
			child_bone.global_scale -= operation_bone.scale - operation_transfrom.get_scale();
			
			get_modification_stack().get_skeleton().set_bone_local_pose_override(
				child_index, child_bone.transform, get_modification_stack().strength, true
			);
