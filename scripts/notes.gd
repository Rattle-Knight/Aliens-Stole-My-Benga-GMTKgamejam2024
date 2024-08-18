extends Node2D

@onready var notes = get_children()
@onready var timer = $"../Timer"

var orignalposnotes = []
var switch = false
var trig = 0

func _ready():
	for note in notes:
		orignalposnotes.append(note.position)

func _process(delta):
		var direction = Vector2(0,0.2)
		if switch:
			direction = Vector2(0,-0.2)
		
		for noteindx in range(len(notes)):
			notes[noteindx].position += direction 


func _on_timer_timeout():
	trig += 1
	if trig % 2 == 0:
		switch = true
	else:
		switch = false
