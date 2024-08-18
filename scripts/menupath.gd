extends Path2D

var fly = false

@onready var path1 = $PathFollow2D
@onready var path2 = $PathFollow2D2
@onready var path3 = $PathFollow2D3
const flyspeed = 550

@onready var paths = [path1,path2,path3]
@export var speed: float = 100.0  # Movement speed

var current_path_index: int = 0
var current_follow_node: PathFollow2D

func _ready():
	if paths.size() > 0:
		start_next_path()

func _process(delta):
	if current_follow_node:
		if current_follow_node.progress_ratio > 0.99:
			current_path_index += 1
			if current_path_index >= paths.size():
				current_path_index = 0  # Reset to the first path
			start_next_path()
	
	if current_follow_node:
		current_follow_node.progress += flyspeed * delta

func start_next_path():
	# Get the current path and set up PathFollow2D
	var path = paths[current_path_index]
	current_follow_node = path
	

