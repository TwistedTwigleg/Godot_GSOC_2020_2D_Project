extends Position2D

export(NodePath) var tip_node 
onready var active = false

func _process(delta):
	if active:
		self.position = get_global_mouse_position()

func _input(event):
	if active:
		if event is InputEventMouseButton and not event.is_pressed():
			print("Released")
			active = false
			#self.position = get_node(tip_node).global_position

func _on_Tip_input_event(viewport, event, shape_idx):
	print(event)
	if event is InputEventMouseButton and event.is_pressed():
		print("Pressed")
		self.position = get_node(tip_node).global_position
		active = true
