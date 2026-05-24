class_name ConnectorDotManager extends Node2D

var dots: Array[ConnectorDot] = []

func _ready() -> void:
	for dot in get_children():
		if dot is ConnectorDot:
			dots.append(dot)
			dot.started.connect(_on_start)

func _on_start() -> void:
	for dot in dots:
		dot.started.disconnect(_on_start)
		if dot.state == "ready":
			dot.waiting()
