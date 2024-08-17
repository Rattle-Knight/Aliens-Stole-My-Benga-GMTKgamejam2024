extends CharacterBody2D

@export var speed = 250
@export var maxspeed = 500
@export var jump_power = -750
@export var gravity = 1000
@export var fall_gravity = 10000
@export var climbingspeed =  200.0

@onready var camera = $Camera2D

var gumtrig = 0
const acc = 50
const friction = 70


#QUICKTIME VARS
var target_presses: int = 20
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
		#GameOver.game_over()

func check_climbable():
	if Global.laddercount > 0:
		climbable = true
	else:
		climbable = false

func check_gum():
	if Global.steppedingum:
		gum = true
		gumtrig += 1
		if gumtrig == 1:
			gumquicktimeevent()
		if quicktimesuccess:
			print("real")
			var tween = create_tween()
			tween.tween_property(self,"position",Global.gumpos + Vector2(40*gum_dir,-10),2)
			tween.tween_property(camera,"rotation",camera.rotation_degrees - 7,0.1)
			tween.tween_property(camera,"zoom",Vector2(1.0,1.0),0.1)
			_reset_mashing()
			quicktimesuccess = false
			Global.steppedingum = false
			gumtrig = 0
	else:
		gum = false


func gumquicktimeevent():
	_start_mashing()
	#CAMERA TWEENS
	var camt = create_tween()
	camt.tween_property(self,"position",Global.gumpos,1)
	camt.tween_property(camera,"rotation",camera.rotation_degrees + 7,2)
	
	camt.tween_property(camera,"zoom",Vector2(1.3,1.3),2)

	#POSITIONAL TWEENS
	

	
func _process(delta: float):
	if _is_mashing and gum:
		print(_press_count)
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
		var tweenspeed = create_tween()
		tween.tween_property(self, "scale", Vector2(0,0), timer)
		tweenspeed.tween_property(self, "speed",maxspeed, timer)
		tween.connect("finished", on_tween_finished)

func on_tween_finished():
	print("died")
	#GameOver.game_over()

func play_animation():
	pass


func _start_mashing():
	_reset_mashing()
	_is_mashing = true

func _reset_mashing():
	_press_count = 0
	_is_mashing = false



