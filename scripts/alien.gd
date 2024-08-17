extends Node2D


@onready var player = get_tree().get_first_node_in_group("player")
var FOLLOW_SPEED = 0.5

func _process(delta):
	position.x = lerp(position.x,player.position.x-100,delta*FOLLOW_SPEED)
