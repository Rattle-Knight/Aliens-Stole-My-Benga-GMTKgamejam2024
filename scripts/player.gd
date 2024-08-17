extends CharacterBody2D

@export var minspeed = 250
@export var maxspeed = 700
@export var jump_power = -750
@export var gravity = 1000
@export var fall_gravity = 10000
@export var climbingspeed =  200.0

@onready var camera = $Camera2D

var speed = 250


var gumtrig = 0
var acc = 50
const friction = 70


#QUICKTIME VARS
var target_presses: int = 10
var time_limit: float = 5.0
var key_to_mash: StringName = "space" # Default key (Enter/Space)
var _press_count: int = 0
var _time_left: float = 0.0
var _is_mashing: bool = false
var quicktimesuccess = false

var climbable = false
var gum = false
var gum_dir = 1
@export var shrinking = true


func _ready():
	change_size()

func check_scale():
	if scale <= Vector2(0,0):
		print("dead")
	else:
		speed = lerp(minspeed,maxspeed,1-scale.x)

func check_climbable():
	if Global.laddercount > 0:
		climbable = true
	else:
		climbable = false


#CODE FOR GUM QUICKTIME EVENT 1
func check_gum():
	if Global.steppedingum:
		gum = true
		gumtrig += 1
		if gumtrig == 1 or quicktimesuccess:
			gumquicktimeevent()
	else:
		gum = false

#CODE FOR GUM QUICKTIME EVENT 2
func gumquicktimeevent():
	var camt : Tween
	if not quicktimesuccess:
		camt =create_tween()
		_start_mashing()
	
	#CAMERA TWEENS
		camt.set_parallel()
		camt.tween_property(self,"position",Global.gumpos+ Vector2(0,-20),1)
		camt.tween_property(camera,"rotation",camera.rotation_degrees + 7,1)
		camt.tween_property(camera,"zoom",Vector2(1.3,1.3),1)
	
	if quicktimesuccess:
		var tween = create_tween()
		tween.tween_property(self,"position",Global.gumpos + Vector2(100*gum_dir,-10),0.1)
		tween.tween_property(camera,"rotation",camera.rotation_degrees - 7,0.1)
		tween.tween_property(camera,"zoom",Vector2(1.0,1.0),0.1)
		_reset_mashing()
		await tween.finished
		quicktimesuccess = false
		Global.steppedingum = false
		gumtrig = 0



func _process(delta: float):
	#CODE FOR GUM QUICKTIME EVENT 3
	if _is_mashing and gum:
		if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
			_press_count += 1
			gum_dir = Input.get_axis("left", "right")
			
			if _press_count >= target_presses:
				_is_mashing = false
				quicktimesuccess = true
				



func _physics_process(delta):
	check_scale()
	check_gum()
	
	
	#gum disables movement mostly
	check_climbable()
	var input_dir: Vector2 = input()
	if input_dir != Vector2.ZERO and not gum:
		accelerate(input_dir)
		play_animation()
	else:
		add_friction()
		play_animation()
	
	if climbable and not gum:
		if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
			velocity.y = (Input.get_axis("up", "down") * climbingspeed)
		elif Input.is_action_pressed("space"):
			velocity.y = -climbingspeed
	elif not gum:
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


@export var timer = 15

func change_size():
	if shrinking:
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(0,0), timer)
		tween.connect("finished", on_tween_finished)

func on_tween_finished():
	print("died")
	#GameOver.game_over()

func play_animation():
	pass



#CODE FOR GUM QUICKTIME EVENT 4
func _start_mashing():
	_reset_mashing()
	_is_mashing = true

func _reset_mashing():
	_press_count = 0
	_is_mashing = false



