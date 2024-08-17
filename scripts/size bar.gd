extends Control

@onready var player = get_tree().get_first_node_in_group("player")

@export var health_max = 1
var health = health_max

@onready var health_bar = $SizeBar
@onready var shrink_timer = $shrink_timer
@onready var player_size = player.scale
#in form of vector2 (1,1) at beginning

func _ready():
	
	life_change()
	#shrink_timer.wait_time = 1
	#shrink_timer.start()

func life_change():
	health = player_size.x
	
	health = clamp(health, 0, health_max)
	health_bar.value = health

#func _on_shrink_timer_timeout():
	#life_change(-1)
