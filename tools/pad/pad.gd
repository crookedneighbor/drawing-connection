class_name Pad extends Node2D

signal enter_drawable_area
signal exit_drawable_area

@onready var drawable_area: Area2D = $Area2D

func _ready() -> void:
	drawable_area.mouse_entered.connect(_on_mouse_enter)
	drawable_area.mouse_exited.connect(_on_mouse_exit)
	
func _on_mouse_enter() -> void:
	enter_drawable_area.emit()

func _on_mouse_exit() -> void:
	exit_drawable_area.emit()
