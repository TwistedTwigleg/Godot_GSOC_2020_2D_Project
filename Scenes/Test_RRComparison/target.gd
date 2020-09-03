extends Position2D

# HACK: changed export to nothing
#@export var tip_node: NodePath
var tip_node: NodePath
@onready var active = false

### HACK
func _ready():
	print(self.name)
	if self.name == "RR_Robot_FABRIK_Target":
		tip_node = NodePath("RR_Robot_FABRIK/Bone2D_A0A/Bone2D_AB/Tip")
### END OF HACK

func _process(delta):
	if active:
		self.position = get_global_mouse_position()

func _input(event):
	if active:
		if event is InputEventMouseButton and not event.is_pressed():
			print("Released on ", self.name)
			active = false

func _on_Tip_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		active = true
