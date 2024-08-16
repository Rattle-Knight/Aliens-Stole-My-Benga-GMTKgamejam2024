extends Control

func _ready():
	self.hide()


func game_over():
	get_tree().paused = true
	self.show()

func _on_retry_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	#Global.playerdead = false
