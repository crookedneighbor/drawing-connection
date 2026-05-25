class_name Level extends Node2D

@export_file("*.tscn") var next_level

@onready var pad: Pad = $Pad
@onready var pencil: Pencil = $Pencil
@onready var controls: Controls = $Controls
@onready var connector_dot_manager: ConnectorDotManager = $ConnectorDotManager

var pressing: bool = false
var within_bounds: bool = false
var is_drawing: bool: 
	get: return pressing and within_bounds
var current_note: String = ""

func _ready() -> void:
	pad.enter_drawable_area.connect(_on_enter_drawable_area)
	pad.exit_drawable_area.connect(_on_exit_drawable_area)
	pencil.released.connect(_on_released)
	connector_dot_manager.started.connect(_on_start)
	connector_dot_manager.win.connect(_on_win)

	_connect_obstacles(get_children())

func restart() -> void:
	get_tree().reload_current_scene()

func _connect_obstacles(children: Array[Node]) -> void:
	for c in children:
		if c is Obstacle:
			c.collide.connect(_on_collide)
		_connect_obstacles(c.get_children())

func _on_released() -> void:
	pressing = false

func _on_enter_drawable_area() -> void:
	within_bounds = true

func _on_exit_drawable_area() -> void:
	if is_drawing:
		print("TODO - left the sketchbook, game over")
		restart()
		return

	within_bounds = false

func _on_start() -> void:
	pencil.start()
	pressing = true

func _on_collide() -> void:
	print('TODO - collide - Play Game Over Animation')
	restart()

func _on_win() -> void:
	pencil.stop()

	if next_level:
		SceneTransitionNode.change_scene(next_level)
