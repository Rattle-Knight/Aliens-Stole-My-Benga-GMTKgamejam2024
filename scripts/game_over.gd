extends Control

func _ready():
	self.hide()


func game_over():
	get_tree().paused = true
	self.show()
	$gameover_music.play()
	Pausemenu.can_esc = false

func _on_retry_button_pressed():
	$click.play()
	$gameover_music.stop()
	await get_tree().create_timer(0.1).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
	self.hide()
	Pausemenu.can_esc = true
	#Global.playerdead = false


func _on_button_mouse_entered():
	$hover.play()
