extends Node2D


@onready var player = get_tree().get_first_node_in_group("player")
var FOLLOW_SPEED = 0.5

@export var isplaying = false
@export var flipsprite = false
@export var shelving = false

@export var firerate : float = 4

func _ready():
	$turret.get_node("Timer").wait_time = firerate
	$turret2.get_node("Timer").wait_time = firerate
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
		$notes.position = Vector2(-572, -4)
		
func _process(delta):
	if not isplaying and not shelving:
		position.x = lerp(position.x,player.position.x-100,delta*FOLLOW_SPEED)
		position.y = lerp(position.y,player.position.y-500,delta*FOLLOW_SPEED)
		Global.ceasefire = false
	if not isplaying and shelving:
		position.x = lerp(position.x,player.position.x-100,delta*FOLLOW_SPEED)
		position.y = lerp(position.y,player.position.y+250,delta*FOLLOW_SPEED)
		$AlienEyeball.shelfing = true
		$AlienEyeball2.shelfing = true
		Global.ceasefire = false
	if isplaying:
		Global.ceasefire = true
