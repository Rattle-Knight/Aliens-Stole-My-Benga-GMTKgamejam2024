extends Sprite2D

@onready var player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.

@export var eye_radius: float = 5

var eye_center: Vector2

var shelfing = false

func _ready():
	eye_center = position

func _process(_delta):
	if player and not shelfing:
		var direction = (player.global_position - global_position).normalized()
		var distance_to_player = global_position.distance_to(player.global_position)
		var clamped_distance = min(distance_to_player, eye_radius)
		
		position = eye_center + direction * clamped_distance
