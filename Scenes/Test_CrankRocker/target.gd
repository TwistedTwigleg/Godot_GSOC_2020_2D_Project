extends Position2D

# HACK: changed export to nothing
#@export var tip_node: NodePath
var tip_node: NodePath
@onready var active = false

### HACK
func _ready():
	print(self.name)
	if self.name == "Crank_Target":
		tip_node = NodePath("Crank/Bone2D/Tip")
	elif self.name == "Crank_Rocker_Target_1":
		tip_node = NodePath("Crank_Rocker_1/Bone2D_A0A/Tip")
	elif self.name == "Crank_Rocker_Target_2":
		tip_node = NodePath("Crank_Rocker_2/Bone2D_B0B/Tip")
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
