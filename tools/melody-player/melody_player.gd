class_name MelodyPlayer extends AudioStreamPlayer2D

var playback: AudioStreamGeneratorPlayback
var phase: float = 0.0

var notes: Dictionary[String, float] = {
	"C": 261.62,
	"D": 293.66,
	"E": 329.63,
	"G": 392.0,
	"A": 440.0,
}

@onready var sample_hz: float = stream.mix_rate

func _ready() -> void:
	play()
	playback = get_stream_playback()

func random_note() -> String:
	return notes.keys().pick_random()

func play_note(note: String) -> void:
	var pulse_hz = notes[note]
	if not pulse_hz:
		return

	var increment = pulse_hz / sample_hz
	var frames_available = playback.get_frames_available()
	
	for i in range(frames_available):
		var sample = sin(phase * TAU)
		playback.push_frame(Vector2(sample, sample))
		phase = fmod(phase + increment, 1.0)
