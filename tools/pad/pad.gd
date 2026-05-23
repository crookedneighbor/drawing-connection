class_name Pad extends Node2D

signal enter_drawable_area
signal exit_drawable_area
signal section_change

@export_range(1, 20) var number_of_horizontal_areas: int = 1

@onready var horizontal_areas: Node2D = $HorizontalAreas
@onready var drawable_area: Area2D = $Area2D
@onready var drawable_area_collision: CollisionShape2D = $Area2D/CollisionShape2D

func _ready() -> void:
	drawable_area.mouse_entered.connect(_on_mouse_enter)
	drawable_area.mouse_exited.connect(_on_mouse_exit)
	
	var position_of_drawable_area = drawable_area_collision.position
	var size = drawable_area_collision.shape.get_rect().size
	var width_of_horizontal_areas = size.x
	var height_of_horizontal_areas= size.y / number_of_horizontal_areas
	for i in number_of_horizontal_areas:
		var section = PadSection.new(i, width_of_horizontal_areas, height_of_horizontal_areas)
		section.set_pos(position_of_drawable_area.x, position_of_drawable_area.y + (i * height_of_horizontal_areas))
		section.mouse_entered.connect(func(): section_change.emit(section.index))
		horizontal_areas.add_child(section)

func _on_mouse_enter() -> void:
	enter_drawable_area.emit()

func _on_mouse_exit() -> void:
	exit_drawable_area.emit()
