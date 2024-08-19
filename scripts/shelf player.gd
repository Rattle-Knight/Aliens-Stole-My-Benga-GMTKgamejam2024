extends Node

@onready var player = get_tree().get_first_node_in_group("player")
var t = 0
var t2  = 0

func _on_zomout_body_entered(body):
	if body == player:
		t += 1
		if t == 1:
			var tween = create_tween() 
			tween.tween_property($"../player/Camera2D","zoom",Vector2(0.5,0.5),2)
			$"../alien".isplaying = false



func _on_scene_change_body_entered(body):
	if body == player:
		t2 += 1
		if t2 == 1:
			var tween = create_tween() 
			tween.set_parallel()
			tween.tween_property($"../player/Camera2D","zoom",Vector2(1,1),2)
			tween.tween_property($"../alien","position",Vector2(468, 1788),5)
			$"../alien".isplaying = true
