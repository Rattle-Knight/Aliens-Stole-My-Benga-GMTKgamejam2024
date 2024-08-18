extends Control

var can_esc = true

var _is_paused:bool = false:
	set = set_paused

func _ready():
	_is_paused = false

func _unhandled_input(event: InputEvent) -> void:
	if can_esc:
		if event .is_action_pressed("pause"):
			_is_paused =  !_is_paused
			$click.play()

func set_paused(value:bool) ->void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_resume_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	_is_paused = false

func _on_restart_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().reload_current_scene()
	_is_paused = false

func _on_quit_pressed():
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()

func _on_resume_mouse_entered():
	$hover.play()

func _on_restart_mouse_entered():
	$hover.play()

func _on_quit_mouse_entered():
	$hover.play()


func _on_mvolume_drag_ended(value_changed):
	$click.play()

