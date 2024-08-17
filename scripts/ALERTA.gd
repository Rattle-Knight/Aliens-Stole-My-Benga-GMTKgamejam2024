extends Node

var dir : float

@onready var aro = $"../Arrow"
@onready var a = $"../ALERTA"
@onready var d = $"../ALERTD"

func _process(delta):
	if Global.steppedingum:
		a.visible = true
		d.visible = true
		dir = Input.get_axis("left", "right")
		if dir == -1:
			aro.flip_v = false
			aro.visible = true
			aro.position -= Vector2(0.2,0)
		elif dir == 1:
			aro.position += Vector2(0.2,0)
			aro.flip_v = true
			aro.visible = true

	else:
		aro.position = Vector2(0,-77)
		aro.visible = false
		a.visible = false
		d.visible = false
