extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var readyup = create_tween()
	readyup.set_parallel()
	Global.forcestop = true
	readyup.tween_property($"../player/Camera2D","zoom",Vector2(0.4,0.4),4)
	readyup.tween_property($"../player","position",Vector2(10271, 523),4)
	readyup.tween_property($"../player/alien2","position",Vector2(-324, -77),4)
	readyup.tween_property($"../player/alien2","rotation_degrees",$"../player/alien2".rotation_degrees -90, 4)
	readyup.tween_property($"../player/CollisionShape2D3","position",Vector2(0, 377),4)
	readyup.tween_property($"../player/CollisionShape2D3","scale",Vector2(10,15),4)
	await readyup.finished
	$"../alien".isplaying = false
	Global.under_control = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"../alien".scale < Vector2(0.1, 0.1):
		$"../alien".scale = Vector2(0.0, 0.0)
		_on_vitory()


@export var connected_scene: String
var scene_folder = "res://levels/actual levels/"
@onready var player = get_tree().get_first_node_in_group("player") 

func _on_vitory():

	var full_path = scene_folder + connected_scene + ".tscn"
	var scene_tree = get_tree()
	var growback = create_tween()
	growback.tween_property(player,"scale",Vector2(1,1),1)
	await growback.finished
	scene_tree.change_scene_to_file(full_path)
