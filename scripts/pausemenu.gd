extends Control

var _is_paused:bool = false:
	set = set_paused

func _ready():
	_is_paused = false

func _unhandled_input(event: InputEvent) -> void:
	if event .is_action_pressed("pause"):
		_is_paused =  !_is_paused

func set_paused(value:bool) ->void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_resume_pressed():
	_is_paused = false

func _on_quit_pressed():
	get_tree().quit()


func _on_mvolume_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_music_changed(value):
	AudioServer.set_bus_volume_db(1, value)

