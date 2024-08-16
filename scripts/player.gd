extends CharacterBody2D

@export var speed = 250
@export var jump_power = -750
@export var gravity = 1000
@export var fall_gravity = 10000
@export var climbingspeed =  200.0



const acc = 50
const friction = 70

var climbable = false

func check_climbable():
	if Global.laddercount > 0:
		climbable = true
	else:
		climbable = false

func _physics_process(delta):
	check_climbable()
	var input_dir: Vector2 = input()
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		play_animation()
	else:
		add_friction()
		play_animation()
	
	if climbable:
		if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
			velocity.y = (Input.get_axis("up", "down") * climbingspeed)
		elif Input.is_action_pressed("space"):
			velocity.y = -climbingspeed
	else:
		if not is_on_floor():
			velocity.y += get_grav() *delta 
		else:
			jump(input_dir)
	
	player_movement()

func get_grav():
	if velocity.y < 0:
		return gravity
	return fall_gravity

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

func jump(input_dir):
	if Input.is_action_just_released("space") and velocity.y < 0:
		velocity.y += jump_power /4
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y += jump_power 


func play_animation():
	pass
