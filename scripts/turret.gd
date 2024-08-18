extends Node2D

@onready var ray_cast = $"../RayCast2D"
@onready var timer: Timer = $"../Timer"
@export var ammo : PackedScene

@onready var player = get_tree().get_first_node_in_group("player")



func _ready():
	timer.start()

func _process(delta):
	_aim()
	#_check_player_collision()

func _aim():
	ray_cast.target_position = to_local(player.position)
	await timer.timeout


#func _check_player_collision():
	#if ray_cast.get_collider() == player and timer.is_stopped():
		#timer.start()
	#elif ray_cast.get_collider() != player and not timer.is_stopped():
		#timer.stop()

func _on_timer_timeout():
	if not Global.ceasefire:
		_shoot()

func _shoot():
	var bullet = ammo.instantiate()
	add_child(bullet)
	bullet.position = position
	bullet.direction = (ray_cast.target_position).normalized()
	$"../AudioStreamPlayer2D".play_with_random_pitch()
	
	#bullet cleanup
	var children = get_children()
	for childindx in range(len(children)):
		if children[childindx].position.x > get_viewport().size.x or children[childindx].position.y > get_viewport().size.y:
			children[childindx].queue_free()

