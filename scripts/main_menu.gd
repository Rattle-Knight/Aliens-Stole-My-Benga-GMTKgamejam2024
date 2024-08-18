extends Control

func _ready():
	Pausemenu.can_esc = false

func _on_start_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://levels/climbtest.tscn")
	Pausemenu.can_esc = true

func _on_exit_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()

func _on_start_mouse_entered():
	$hover.play()

func _on_quit_mouse_entered():
	$hover.play()
