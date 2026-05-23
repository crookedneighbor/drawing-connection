class_name Main extends Node2D

@onready var button: Button = $Button
@onready var melody_player: MelodyPlayer = $MelodyPlayer

var pressing: bool = false

func _ready() -> void:
	button.button_down.connect(_on_button_pressed)
	button.button_up.connect(_on_button_released)

func _process(_delta: float) -> void:
	if pressing:
		melody_player.play_note("C")

func _on_button_pressed() -> void:
	melody_player.volume_db = 0
	pressing = true

func _on_button_released() -> void:
	pressing = false
	melody_player.volume_db = -80
