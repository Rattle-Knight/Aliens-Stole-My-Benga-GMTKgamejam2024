extends Control

@export var connected_scene = ""
var scene_folder = "res://scenes/actual levels/"

func _process(_delta):
	if Global.playerisatom:
		$game_over.visible = true
		



func _on_retry_button_pressed():
	var full_path = scene_folder + connected_scene + ".tscn"
	var scene_tree = get_tree()
	Global.playerdead = false
	Global.openapp = true
	Global.player_is_ready = false
	Global.safe_area_count = 1
	scene_tree.change_scene_to_file(full_path)
