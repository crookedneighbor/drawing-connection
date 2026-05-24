class_name ConnectorDotManager extends Node2D

signal started
signal win

var dots: Array[ConnectorDot] = []

func _ready() -> void:
	for dot in get_children():
		if dot is ConnectorDot:
			dots.append(dot)
			dot.started.connect(_on_start)
			dot.found.connect(_on_found)

func _on_start() -> void:
	for dot in dots:
		dot.started.disconnect(_on_start)
		if dot.state == "ready":
			dot.waiting()

	started.emit()

func _on_found() -> void:
	var all_connected: bool = true
	for dot in dots:
		if dot.state != "connected":
			all_connected = false
	
	if all_connected:
		win.emit()
