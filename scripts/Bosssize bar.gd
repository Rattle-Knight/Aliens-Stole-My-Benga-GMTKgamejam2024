extends Control

@onready var alien = get_tree().get_first_node_in_group("actualalien")

@onready var health_bar = $SizeBar




func _process(_delta):
	if alien:
		var health_min = health_bar.min_value
		var health_max = health_bar.max_value
		var alien_size = alien.scale
		var healthbar_result = lerp(health_min,health_max,alien_size.x)
		health_bar.value = healthbar_result
