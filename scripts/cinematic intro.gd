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
		$ParallaxBackground3.visible = false
		$ParallaxBackground4.visible = true
	elif trig == 5:
		$ParallaxBackground4.visible = false
		$ParallaxBackground5.visible = true
	elif trig == 6:
		$ParallaxBackground5.visible = false
		$ParallaxBackground6.visible = true
	elif trig == 7:
		$ParallaxBackground6.visible = false
		$ParallaxBackground7.visible = true
	elif trig == 8:
		$ParallaxBackground7.visible = false
		$ParallaxBackground8.visible = true
	elif trig == 9:
		get_tree().change_scene_to_file("res://levels/actual levels/Level1.tscn")
