extends Control

@onready var player = get_tree().get_first_node_in_group("player")

@onready var health_bar = $SizeBar
@onready var player_size = player.scale



func _process(delta):
	var health_min = health_bar.min_value
	var health_max = health_bar.max_value
	player_size = player.scale
	var healthbar_result = lerp(health_min,health_max,player_size.x)
	health_bar.value = healthbar_result


