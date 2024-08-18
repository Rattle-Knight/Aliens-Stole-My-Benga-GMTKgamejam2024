extends Control


func _on_start_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://levels/actual levels/Level1.tscn")

func _on_exit_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()

func _on_start_mouse_entered():
	$hover.play()

func _on_quit_mouse_entered():
	$hover.play()
