extends Node

@onready var player = get_tree().get_first_node_in_group("player")
@onready var piece1 = $"../benga tower/benga 8/Benga1"
@onready var piece1_2 = $"../benga tower/benga 9/Benga"
@onready var piece2 = $"../benga tower/benga 7/Benga"
@onready var alien1 = $"../alien"
@onready var alien2 = $"../alien2"

@onready var infpieceL = $"../benga tower/benga left"
@onready var infpieceR = $"../benga tower/benga right"
@onready var lone = $"../benga tower/LoneBenga"



var turn3 = 0
var turn = 0
var turn2 = 0
var turn4 = 0


func _on_benga_movement_1_body_entered(body):
	#FIRST TURN
	if body == player:
		turn += 1
		#alien 1 turn
		if turn == 1:
			piece1.get_node("BlastAlien").visible = true
			var alientween = create_tween()
			var movetween = create_tween()
			movetween.set_parallel()
			movetween.tween_property(piece1,"position",Vector2(188,433),1)
			movetween.tween_property(piece1_2,"position",Vector2(295,496),1)
			
			alientween.tween_property(alien1,"position",Vector2(-939, -1440),10)
			
			await movetween.finished
			#move piece1 fully out
			movetween = create_tween()
			movetween.set_parallel(false)
			movetween.tween_property(piece1,"position",Vector2(-210, 526),0.5)
			movetween.tween_property(piece1,"position",Vector2(-4, -285),1.2)
			
			
			await movetween.finished
			
			#alien 2's turn
			movetween = create_tween()
			movetween.set_parallel(false)
			piece2.get_node("BlastAlien").visible = true
			movetween.tween_property(piece2,"position",Vector2(716, 504),1)
			
			alientween = create_tween()
			alientween.tween_property(alien2,"position",Vector2(556, -1206),5)

func _on_benga_movement_2_body_entered(body):
	if body == player:
		turn2 += 1
		
		if turn2 == 1:
			var alientween = create_tween()
			alientween.tween_property(alien2,"position",Vector2(623, -204),1)
			alientween = create_tween()
			alientween.tween_property(alien1,"position",Vector2(-821, -460),1)
			




			


func _on_benga_movement_3_body_entered(body):
	if body == player:
		turn3 += 1
		if turn3 == 1:
			#finale
				var alientween = create_tween()
				alientween.set_parallel()
				alientween.tween_property(alien1,"position",Vector2(-468, -1788),5)
				alientween.tween_property(alien2,"position",Vector2(392, -1796),5)
				var movepaytween = create_tween()
				movepaytween.tween_property(player,"position",Vector2(286, -1415),0.5)
				await movepaytween.finished
				Global.forcestop = true
				
				#"trap"
				var movetween = create_tween()
				movetween.set_parallel()
				movetween.tween_property(infpieceL,"position",Vector2(-79, -1867),1)
				movetween.tween_property(infpieceR,"position",Vector2(-88, -1872),1)
				
				await alientween.finished
				movetween = create_tween()
				movetween.tween_property(lone,"position",Vector2(609, -1574),1)
				await movetween.finished
				$badonk.play()
				alientween = create_tween()
				Global.forcestop = false
				
				
				$"../alien".isplaying = false
				alientween.tween_property(alien2,"position",Vector2(623, -204),0.8)
				alientween.tween_property(alien2,"rotation_degrees",alien2.rotation_degrees + 97,0.8)
				



func _on_scene_change_body_entered(body):
		if body == player:
			turn4 += 1
			if turn4 == 1:
				#finale
				$"../alien".isplaying = true
				var alientween = create_tween()
				alientween.tween_property(alien1,"position",Vector2(-468, -1788),5)
