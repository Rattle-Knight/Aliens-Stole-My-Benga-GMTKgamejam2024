extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@export var dir = "r"

func _on_area_2d_body_entered(body):
	if body == player:
		Global.laddercount +=1



func _on_body_exited(body):
	if body == player:
		Global.laddercount -=1

