extends CharacterBody2D
class_name alien_gun

@onready var fire_timer = $Timer
@onready var gun_track = $gun_track

@export var fire_rate : float = 5.0


var can_fire : bool = true

func _ready():
	fire_timer.connect("timeout", set_can_fire)
	fire_timer.wait_time = fire_rate

func _process(delta):
	gun_track.track_player(self)
	fire_projectile()

func fire_projectile() -> void:
	if Input.is_action_just_pressed("click") and can_fire == true:
		can_fire = false
		fire_timer.start()
		print("fire")
	

func set_can_fire() -> void:
	can_fire = true
