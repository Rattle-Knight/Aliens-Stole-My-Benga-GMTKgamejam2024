extends Node2D

var direction : Vector2 = Vector2.RIGHT
var speed: float = 300

@onready var player = get_tree().get_first_node_in_group("player")
@export var shrinkdur = 0.5


func _ready():
	position = get_parent().position

func _physics_process(delta):
	position += direction * speed * delta




func _on_area_2d_body_entered(body):
	if body == player:
		var tween = create_tween()
		tween.tween_property(player, "scale", player.scale - Vector2(30,30) , shrinkdur)


