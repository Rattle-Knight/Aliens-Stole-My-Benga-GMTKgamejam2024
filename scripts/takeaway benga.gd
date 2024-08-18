extends Node
@onready var player = get_tree().get_first_node_in_group("player")
var trig = 0
var triga = 0
var trigaa = 0
var trigaaa= 0

@onready var benga = $"../objects/mini benga tower"

func _on_takeaway_body_entered(body):
	if body == player:
		trig += 1
		if trig == 1:
			var altween = create_tween()
			altween.set_parallel()
			altween.tween_property($"../alien","position",Vector2(0, -502),2.5)
			altween.tween_property($"../alien2","position",Vector2(1381, -502),2.5)
			altween.tween_property($"../player/Camera2D","zoom",$"../player/Camera2D".zoom - Vector2(0.5,0.5),2)
			await altween.finished
			
			var tween = create_tween()
			tween.tween_property(benga,"position",Vector2(158, -502),3)
			$"../objects/mini benga tower/AudioStreamPlayer2D".play()
			$"../objects/mini benga tower/BlastAlien".visible = true
			$"../objects/mini benga tower/BlastAlienBlackHole".visible = true
			await tween.finished
			
			altween = create_tween()
			altween.tween_property($"../alien2","position",Vector2(4445, -2703),2)
			tween = create_tween()
			tween.tween_property(benga,"position",Vector2(4145, -2703),2)
			


func _on_takeaway_2_body_entered(body):
	if body == player:
		triga += 1
		if triga == 1:
			Global.showhud = true
			var altween = create_tween()
			altween.tween_property($"../player/Camera2D","zoom",$"../player/Camera2D".zoom + Vector2(0.5,0.5),1)
			altween.tween_property($"../alien","position",Vector2(509, 58),1)
			await altween.finished
			$"../alien".isplaying = false
			
			

func bgsqequence():
	var altween = create_tween()
	benga.z_index -= 4
	$"../alien2".z_index -= 2
	altween.set_parallel()
	altween.tween_property(benga,"scale",Vector2(0.195, 0.195),0.1)
	altween.tween_property($"../alien2","scale",Vector2(0.24, 0.24),0.1)
	altween.tween_property($"../alien2","position",Vector2(8226, 81),2)
	altween.tween_property(benga,"position",Vector2(8186, 81),2)



func _on_takeaway_3_body_entered(body):
	if body == player:
		trigaa += 1
		if triga == 1:
			bgsqequence()


func _on_takeaway_4_body_entered(body):
	if body == player:
		trigaaa += 1
		if trigaaa == 1:
			$"../alien".isplaying = true
			
