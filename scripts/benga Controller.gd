extends Node

@onready var player = get_tree().get_first_node_in_group("player")
@onready var piece1 = $"../benga tower/benga 8/Benga1"
@onready var piece1_2 = $"../benga tower/benga 9/Benga"
@onready var piece2 = $"../benga tower/benga 7/Benga"

var turn = 0


func _on_benga_movement_1_body_entered(body):
	#FIRST TURN
	if body == player:
		turn += 1
		#alien 1 turn
		if turn == 1:
			piece1.get_node("BlastAlien").visible = true
			var movetween = create_tween()
			movetween.set_parallel()
			movetween.tween_property(piece1,"position",Vector2(188,433),1)
			movetween.tween_property(piece1_2,"position",Vector2(295,496),1)
		
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
			movetween.tween_property(piece2,"position",Vector2(716, 504),0.5)
