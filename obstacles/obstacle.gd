class_name Obstacle extends Area2D

signal collide

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is DrawnLine:
		collide.emit()
