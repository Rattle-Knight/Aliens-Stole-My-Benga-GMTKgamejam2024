extends CharacterBody2D

@export var speed = 550
@export var jump_power = -200
@export var gravity = 120

func _physics_process(delta):
	
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = 0
	
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
