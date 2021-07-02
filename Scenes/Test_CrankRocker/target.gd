extends Position2D

@onready var active = false

func _process(delta):
	if active:
		self.position = get_global_mouse_position()

func _input(event):
	if active:
		if event is InputEventMouseButton and not event.is_pressed():
			active = false

func _on_Tip_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		active = true
