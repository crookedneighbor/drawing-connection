class_name Pencil extends Node2D

signal released

@onready var paper: Node2D = $Paper

var current_line: Line2D = null
var drawing_in_progress: bool = false
var in_drawable_area: bool = false

var pencil = load("res://tools/pencil/pencil.png")

func _ready():
	Input.set_custom_mouse_cursor(pencil)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if not event.pressed:
				drawing_in_progress = false
				released.emit()

	elif event is InputEventMouseMotion and drawing_in_progress:
		if in_drawable_area:
			current_line.add_line(event.position)
		elif not current_line.points.is_empty():
			current_line = add_new_line()

func start() -> void:
	if drawing_in_progress:
		return
	drawing_in_progress = true
	current_line = add_new_line()
	current_line.add_line(get_global_mouse_position())

func stop() -> void:
	drawing_in_progress = false

func add_new_line() -> DrawnLine:
	var line = DrawnLine.new()
	paper.add_child(line)
	return line

func clear() -> void:
	drawing_in_progress = false
	for c in paper.get_children():
		c.queue_free()

func enter_drawable_area() -> void:
	in_drawable_area = true

func exit_drawable_area() -> void:
	in_drawable_area = false
