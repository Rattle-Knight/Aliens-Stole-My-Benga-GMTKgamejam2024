extends Node2D

@onready var ray_cast = $"../RayCast2D"
@onready var timer: Timer = $"../Timer"
@export var ammo : PackedScene

@onready var player = get_tree().get_first_node_in_group("player")

var dmg = Vector2(0.1,0.1)
var is_enemy = false

func _ready():
	timer.start()

func _process(_delta):
	_aim()
	#_check_player_collision()

func _aim():
	if not Global.under_control or is_enemy:
		ray_cast.target_position = to_local(player.position)
		await timer.timeout
	if Global.under_control:
		var mouse_pos = get_global_mouse_position()
		ray_cast.target_position = to_local(mouse_pos)
		await timer.timeout


#func _check_player_collision():
	#if ray_cast.get_collider() == player and timer.is_stopped():
		#timer.start()
	#elif ray_cast.get_collider() != player and not timer.is_stopped():
		#timer.stop()

func _on_timer_timeout():
	if not Global.ceasefire or Global.under_control:
		_shoot()

func _shoot():
	var bullet = ammo.instantiate()
	if is_enemy:
		bullet.is_enemy = true
	bullet.dmg = dmg
	add_child(bullet)
	bullet.position = position
	bullet.direction = (ray_cast.target_position).normalized()
	$"../AudioStreamPlayer2D".play_with_random_pitch()
	
	#bullet cleanup
	var children = get_children()
	for childindx in range(len(children)):
		if children[childindx].position.x > get_viewport().size.x*2 or children[childindx].position.y > get_viewport().size.y*2:
			children[childindx].queue_free()

