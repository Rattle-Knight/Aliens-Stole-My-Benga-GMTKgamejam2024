extends Node2D
class_name gun_tracking

var player = load("res://scenes/player.tscn")

func _process(delta):
	var pos = get_node("res://scenes/player.tscn").position

func track_player(character_body : CharacterBody2D) -> void:
	character_body.look_at(player.position)

