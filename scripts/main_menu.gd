extends Control



func _on_start_pressed():
	get_tree().change_scene_to_file("res://levels/climbtest.tscn")
	var can_esc = false

func _on_exit_pressed():
	get_tree().quit()
