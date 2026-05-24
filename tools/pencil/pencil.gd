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

		# TODO - may not want to let the right button clear, but it's an easy way
		# to trigger the functionality right now
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			clear()

	elif event is InputEventMouseMotion and drawing_in_progress:
		if in_drawable_area:
			current_line.add_point(event.position)
		elif not current_line.points.is_empty():
			current_line = add_new_line()

func start() -> void:
	if drawing_in_progress:
		return
	drawing_in_progress = true
	current_line = add_new_line()
	current_line.add_point(get_global_mouse_position())

func add_new_line() -> Line2D:
	var line = Line2D.new()
	line.default_color = Color.DIM_GRAY
	line.width = 4
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
