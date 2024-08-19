extends Node2D


@onready var player = get_tree().get_first_node_in_group("player")
var FOLLOW_SPEED = 0.5

@export var isplaying = false
@export var flipsprite = false
@export var shelving = false
@export var isenemy = true
@export var dmg = Vector2(0.1,0.1)
@export var firerate : float = 4
var movesettimerfin = false
var moveset : float
var out = false

func _ready():
	
	
	if shelving:
		$AlienEyeball.shelfing = true
		$AlienEyeball2.shelfing = true
	if isenemy:
		$turret.get_node("bulletmanager").is_enemy = true
		$turret2.get_node("bulletmanager").is_enemy = true
	
	$turret.get_node("Timer").wait_time = firerate
	$turret2.get_node("Timer").wait_time = firerate
	$turret.get_node("bulletmanager").dmg = dmg
	$turret2.get_node("bulletmanager").dmg = dmg
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
		position.x = lerp(position.x,player.position.x-300,delta*FOLLOW_SPEED)
		position.y = lerp(position.y,player.position.y+250,delta*FOLLOW_SPEED)
		Global.ceasefire = false
	if Global.under_control and isenemy:
		if movesettimerfin and not out:
			position.x += moveset *delta*FOLLOW_SPEED
			position.y += moveset *delta*FOLLOW_SPEED

	if isplaying:
		Global.ceasefire = true


func _on_timer_2_timeout():
	if movesettimerfin == false:
		moveset = randf_range(-3000,-200)
		movesettimerfin = true
	else:
		movesettimerfin = false





func _on_area_2d_body_exited(body):
	if body == player:
		out = true


func _on_area_2d_body_entered(body):
	if body == player:
		out = false
