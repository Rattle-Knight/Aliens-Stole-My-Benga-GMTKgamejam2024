extends Node2D

var trig = 0



func _on_timer_timeout():
	trig += 1
	if trig == 1:
		$ParallaxBackground.visible = true 
	elif trig == 2:
		$ParallaxBackground.visible = false
		$ParallaxBackground2.visible = true
	elif trig == 3:
		$ParallaxBackground2.visible = false
		$ParallaxBackground3.visible = true
	elif trig == 4:
		Global.steppedingum = false
		Global.ceasefire = false
		Global.forcestop = false
		Global.playerisatom = false

		Global.showhud = false
		Global.under_control = false
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
