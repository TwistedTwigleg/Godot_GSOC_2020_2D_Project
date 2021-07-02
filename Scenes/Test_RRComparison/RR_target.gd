extends Position2D

var target_nodes
@onready var active = false

func _ready():
	target_nodes = [
		get_parent().get_node("RR_FABRIK_Target"),
		get_parent().get_node("RR_CCDIK_Target"),
		get_parent().get_node("RR_TwoBoneIK_Target")
	]

func _process(delta):
	if active:
		var position_delta = get_global_mouse_position() - self.global_position
		for target in target_nodes:
			target.position += position_delta

func _input(event):
	if active:
		if event is InputEventMouseButton and not event.is_pressed():
			active = false

func _on_Tip_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		active = true
