extends ParallaxLayer

@export var SPEED : float = -15

@onready var parent = get_parent()
func _process(delta):
	if parent.visible:
		motion_offset.x += SPEED * delta
