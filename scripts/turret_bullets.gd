extends Node2D

var direction : Vector2 = Vector2.RIGHT
@export var speed: float = 400

@onready var player = get_tree().get_first_node_in_group("player")
@export var shrinkdur = 1
@onready var alien = get_tree().get_first_node_in_group("alien")
@onready var actualalien = get_tree().get_first_node_in_group("actualalien")
var is_enemy = false
var dmg = Vector2(0.1,0.1)

func _ready():
	position = get_parent().position
	

@onready var alienparent = get_parent().get_parent().get_parent()

func _physics_process(delta):
	if is_enemy:
		speed = 1000
	position += direction * speed * delta
	
	global_scale = Vector2(1,1)



func _on_area_2d_body_entered(body):
	if body == player and (not Global.under_control or is_enemy):
		if player.scale >  Vector2(0.1,0.1):
			var tween = create_tween()
			tween.tween_property(player, "scale", player.scale - dmg , shrinkdur)
	if alien and body == alien and Global.under_control and not is_enemy:
		if alien.scale >  Vector2(0.1,0.1):
			var tween = create_tween()
			tween.tween_property(actualalien, "scale", actualalien.scale - Vector2(0.1,0.1) , shrinkdur)


