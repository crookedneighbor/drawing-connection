class_name Pad extends Node2D

signal enter_drawable_area
signal exit_drawable_area
signal section_change

@export_range(1, 20) var number_of_horizontal_areas: int = 1

@onready var drawable_area: Area2D = $Area2D
@onready var drawable_area_collision: CollisionShape2D = $Area2D/CollisionShape2D

func _ready() -> void:
	drawable_area.mouse_entered.connect(_on_mouse_enter)
	drawable_area.mouse_exited.connect(_on_mouse_exit)

func _on_mouse_enter() -> void:
	enter_drawable_area.emit()

func _on_mouse_exit() -> void:
	exit_drawable_area.emit()
