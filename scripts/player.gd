extends CharacterBody2D

@export var speed = 550
@export var jump_power = -1000
@export var gravity = 120
@export var climbingspeed =  200.0

const acc = 50
const friction = 70

var climbable = false

func _physics_process(delta):
	var input_dir: Vector2 = input()
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		play_animation()
	else:
		add_friction()
		play_animation()
	
	if climbable:
		velocity.y = Input.get_axis("up", "down") * climbingspeed
	else:
		if not is_on_floor():
			velocity.y += gravity * delta
	
	player_movement()
	jump()

func input() -> Vector2:
	var input_dir = Vector2.ZERO
	input_dir.x = Input.get_axis("left", "right")
	input_dir = input_dir.normalized()
	return input_dir
	

func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acc)
	

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)

func player_movement():
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("space"):
		velocity.y = jump_power
	else:
		velocity.y += gravity

func play_animation():
	pass
