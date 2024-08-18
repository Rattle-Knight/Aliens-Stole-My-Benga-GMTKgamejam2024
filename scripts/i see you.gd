extends Node

var t = 0
@onready var player = get_tree().get_first_node_in_group("player")

func _on_takeaway_4_body_entered(body):
	if body == player:
		t += 1
		if t == 1:
			var tween = create_tween()
			tween.tween_property($"../alien","position",Vector2(673, -536),1)
			await tween.finished
			$"../alien".isplaying = false
