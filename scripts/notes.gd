extends Node2D

@onready var notes = get_children()

var orignalposnotes = []

func _ready():
	for note in notes:
		orignalposnotes.append(note.position)

func _process(delta):
		var direction = Vector2(10,0)
		var distance_to_player = global_position.distance_to(player.global_position)
		var clamped_distance = min(distance_to_player, eye_radius)
		
		position = eye_center + direction * clamped_distance


func _on_timer_timeout():
	pass # Replace with function body.
