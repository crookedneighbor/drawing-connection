class_name PadSection extends Area2D

var collision_shape: CollisionShape2D

var width: float
var height: float
var index: int

func _init(_index, _width: float, _height: float) -> void:
	index = _index
	width = _width
	height = _height
	
	collision_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	collision_shape.shape = shape
	add_child(collision_shape)

func set_pos(x: float, y: float) -> void:
	collision_shape.shape.size = Vector2(width, height)
	collision_shape.position = Vector2(x, y)
