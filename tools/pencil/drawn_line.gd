class_name DrawnLine extends Line2D

var body: Area2D

func _init() -> void:
	default_color = Color.DIM_GRAY
	width = 4
	body = Area2D.new()
	body.set_collision_layer_value(1, true)
	body.set_collision_mask_value(2, true)
	add_child(body)

func add_line(position: Vector2) -> void:
	var has_points: bool = points.size() > 0
	var last_point: Vector2 = points[-1] if has_points else Vector2.ZERO
	add_point(position)
	
	# indicates only the initial point is made
	if not has_points:
		return

	var new_point: Vector2 = points[-1]
	var new_shape = CollisionShape2D.new()
	body.add_child(new_shape)
	var rect = RectangleShape2D.new()
	new_shape.position = (last_point + new_point) / 2
	new_shape.rotation = last_point.direction_to(new_point).angle()
	var length = last_point.distance_to(new_point)
	rect.size = Vector2(length, width)
	new_shape.shape = rect
