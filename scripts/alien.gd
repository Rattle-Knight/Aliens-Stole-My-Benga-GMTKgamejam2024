extends Node2D


@onready var player = get_tree().get_first_node_in_group("player")
var FOLLOW_SPEED = 0.5

@export var isplaying = false
@export var flipsprite = false

func _ready():
	if flipsprite:
		$body.flip_h = true
		$turret.position = Vector2(546, 103)
		$turret2.position = Vector2(374, 53)
		
		$AlienEyeball.position = Vector2(242, 243)
		$AlienEyeball.eye_center = Vector2(242, 243)
		$AlienEyeball2.position = Vector2(349, 249)
		$AlienEyeball2.eye_center = Vector2(349, 249)
		
		$Alieneyes.flip_h = true
		$Alieneyes.position = Vector2(337, 310)

func _process(delta):
	if not isplaying:
		position.x = lerp(position.x,player.position.x-100,delta*FOLLOW_SPEED)
		Global.ceasefire = false
	if isplaying:
		Global.ceasefire = true
