extends Area2D


@onready var player = get_tree().get_first_node_in_group("player")

func _on_body_entered(body):
	if body == player:
		var tween = create_tween()
		tween.tween_property(player,"scale",Vector2(0.1,0.1),1)
