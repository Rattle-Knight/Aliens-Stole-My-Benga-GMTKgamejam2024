extends CharacterBody2D
class_name bullet

@onready var sprite_2d = $Sprite2D
@onready var visible_notifier = $visible_notifier
@onready var death_timer = $death_timer

var direction : Vector2 = Vector2.RIGHT
var speed : float = 0.0

func _physics_process(delta):
	move(delta)

func move(delta : float) -> void:
	move_and_collide(direction * speed * delta)


func _on_visible_notifier_screen_exited():
	death_timer.start(0)


func _on_death_timer_timeout():
	queue_free()
