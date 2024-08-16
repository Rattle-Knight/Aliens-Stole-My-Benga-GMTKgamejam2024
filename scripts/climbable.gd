extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")


func _on_area_2d_body_entered(body):
	if body == player:
		player.climbable = true





func _on_body_exited(body):
	if body == player:
		player.climbable = false
