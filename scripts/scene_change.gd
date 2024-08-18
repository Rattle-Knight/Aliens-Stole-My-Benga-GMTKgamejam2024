extends Area2D

@export var connected_scene: String
var scene_folder = "res://levels/actual levels/"
@onready var player = get_tree().get_first_node_in_group("player") 

func _on_body_entered(body):
	if body == player:
		var full_path = scene_folder + connected_scene + ".tscn"
		var scene_tree = get_tree()
		var growback = create_tween()
		growback.tween_property(player,"scale",Vector2(1,1),2)
		await growback.finished
		scene_tree.change_scene_to_file(full_path)
