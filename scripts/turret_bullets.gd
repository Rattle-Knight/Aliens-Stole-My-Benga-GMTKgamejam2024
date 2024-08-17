extends Node2D

var direction : Vector2 = Vector2.RIGHT
var speed: float = 300

@onready var player = get_tree().get_first_node_in_group("player")
@export var shrinkdur = 0.5


func _physics_process(delta):
	position += direction * speed * delta
	if position.x > get_viewport().size.x or position.y > get_viewport().size.y:
		queue_free()



func _on_area_2d_body_entered(body):
	if body == player:
		var tween = create_tween()
		tween.tween_property(player, "scale", player.scale - Vector2(30,30) , shrinkdur)

