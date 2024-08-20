extends Area2D

var trig = 0
@onready var player = get_tree().get_first_node_in_group("player")

func _on_body_entered(body):
	if body == player:
		trig += 1
		if trig == 1:
			var tween = create_tween()
			tween.tween_property(player,"scale",Vector2(0.75,0.75),1)
			$"../benga Controller/womp".play()
