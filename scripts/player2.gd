extends CharacterBody2D

@export var speed = 200
@export var jump_power = -200
@export var gravity = 200
@export var climbingspeed =  200.0

var climbable = false

func _physics_process(delta):
	
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = jump_power
	
	if climbable:
		velocity.y = Input.get_axis("up", "down") * climbingspeed
	else:
		if not is_on_floor():
			velocity.y += gravity * delta
	move_and_slide()
