extends Node2D

@onready var main = get_tree().get_root().get_node("test_world2")
@onready var bullet = load("res://scenes/bullet.tscn")


func _ready():
	shoot()


func shoot():
	var instance = bullet.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	instance.zdex = z_index - 1
	main.add_child.call_deferred(instance)

func _on_cooldown_timeout():
	shoot()
