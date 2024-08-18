extends AudioStreamPlayer2D

func play_with_random_pitch(min_pitch: float = 0.7, max_pitch: float = 1.3):
	pitch_scale = randf_range(min_pitch, max_pitch)
	play()
