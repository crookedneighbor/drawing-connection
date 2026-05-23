class_name Pencil extends Node2D

@onready var paper: Node2D = $Paper

var drawing_in_progress: bool = false
var current_line: Line2D = null
var drawing_started: bool = false

var pencil = load("res://tools/pencil/pencil.png")

func _ready():
	Input.set_custom_mouse_cursor(pencil)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			drawing_in_progress = event.pressed and not drawing_started
			
			if drawing_in_progress:
				drawing_started = true
				current_line = Line2D.new()
				current_line.default_color = Color.DIM_GRAY
				current_line.width = 4
				paper.add_child(current_line)
				current_line.add_point(event.position)
		# TODO - may not want to let the right button clear, but it's an easy way
		# to trigger the functionality right now
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			clear()

	elif event is InputEventMouseMotion and drawing_in_progress:
		current_line.add_point(event.position)

func clear() -> void:
	drawing_started = false
	drawing_in_progress = false
	for c in paper.get_children():
		c.queue_free()
