extends Sprite2D

@export var speed: float = 100.0
@export var tether_distance: float = 50.0
@export var change_direction_interval: float = 2.0


@onready var body: Sprite2D = $"../body"

var direction: Vector2 = Vector2.ZERO
var time_since_direction_change: float = 0.0

func _ready():
	set_random_direction()

func _process(delta: float):
	move_and_collide(delta)

	time_since_direction_change += delta
	if time_since_direction_change >= change_direction_interval:
		set_random_direction()

	# Ensure the alien head stays within the tether distance
	keep_within_tether_distance()

func move_and_collide(delta: float):
	var movement = direction * speed * delta
	var new_position = global_position + movement
	
	global_position = new_position

func set_random_direction():
	time_since_direction_change = 0.0
	direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()

func keep_within_tether_distance():
	var offset = global_position - (body.global_position + Vector2(0,-200))

	if offset.length() > tether_distance:
		# Move back towards the body
		direction = (body.global_position+ Vector2(0,-200) - global_position).normalized()
