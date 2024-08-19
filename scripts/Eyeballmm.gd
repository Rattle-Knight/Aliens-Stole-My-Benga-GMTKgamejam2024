extends Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.

@export var eye_radius: float = 5

var eye_center: Vector2

func _ready():
	eye_center = position

func _process(_delta):
		var mouse_pos = get_global_mouse_position()
		var direction = (mouse_pos - global_position).normalized()
		var distance_to_player = global_position.distance_to(mouse_pos)
		var clamped_distance = min(distance_to_player, eye_radius)
		
		position = eye_center + direction * clamped_distance
