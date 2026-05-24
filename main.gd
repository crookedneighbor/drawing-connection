class_name Main extends Node2D

@onready var melody_player: MelodyPlayer = $MelodyPlayer
@onready var pad: Pad = $Pad
@onready var pencil: Pencil = $Pencil
@onready var controls: Controls = $Controls

@export var connector_dot_manager: ConnectorDotManager

var pressing: bool = false
var within_bounds: bool = false
var is_drawing: bool: 
	get: return pressing and within_bounds
var current_note: String = ""

func _ready() -> void:
	pad.section_change.connect(_on_section_change)
	pad.enter_drawable_area.connect(_on_enter_drawable_area)
	pad.exit_drawable_area.connect(_on_exit_drawable_area)
	pencil.released.connect(_on_released)
	connector_dot_manager.started.connect(_on_start)
	controls.restart.connect(_on_restart)

func _process(_delta: float) -> void:
	if is_drawing:
		melody_player.play_note(current_note)

func _on_section_change(index: int) -> void:
	current_note = melody_player.notes.keys()[index]

func _on_released() -> void:
	pressing = false
	melody_player.volume_db = -80

func _on_enter_drawable_area() -> void:
	if pressing:
		melody_player.volume_db = 0
	within_bounds = true

func _on_exit_drawable_area() -> void:
	melody_player.volume_db = -80
	within_bounds = false

func _on_start() -> void:
	pencil.start()
	melody_player.volume_db = 0
	pressing = true

func _on_restart() -> void:
	get_tree().reload_current_scene()
