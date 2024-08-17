extends Control



func _on_start_pressed():
	get_tree().change_scene_to_file("res://levels/climbtest.tscn")
	Pausemenu.can_esc = true

func _on_exit_pressed():
	get_tree().quit()
