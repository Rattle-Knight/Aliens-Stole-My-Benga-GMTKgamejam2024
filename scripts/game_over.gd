extends Control

@onready var player = get_tree().get_first_node_in_group("player")
func _ready():
	visible = false

func _process(delta):
	if Global.playerisatom:
		
		visible = true
		get_tree().paused = true
		self.show()
		


func _on_retry_button_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
	self.hide()
	Global.playerisatom = false


func _on_button_mouse_entered():
	$hover.play()
