extends Camera2D

const MAX_DIST = 64
const FOLLOW_SPEED = 4

var target_dist = 0
var center_pos = position



func _process(_delta):
	if not Global.steppedingum:
		var direction = center_pos.direction_to(get_local_mouse_position())
		var target_pos = center_pos + direction * target_dist 
	
	
		#MAKES SURE THE CAMERA CANT GO TO FAR
		target_pos = target_pos.clamp(
			center_pos - Vector2(MAX_DIST,MAX_DIST),
			center_pos + Vector2(MAX_DIST,MAX_DIST) 
		)
	
		position = position.lerp(target_pos,_delta*FOLLOW_SPEED)


func _input(event):
	if event is InputEventMouseMotion:
		target_dist = center_pos.distance_to(get_local_mouse_position()) / 2
	
	
	#ZOOMING IS A BIT IFFY AS IT MESSES UP THE CLOUD RE	
	#if event.is_action_pressed("zoom_in"):
		#if zoom < Vector2(0.5,0.5):
			#zoom += Vector2(0.005,0.005)
	#if event.is_action_pressed("zoom_out"):
		#if zoom > Vector2(0.45,0.45):
			#zoom -= Vector2(0.005,0.005)
	
