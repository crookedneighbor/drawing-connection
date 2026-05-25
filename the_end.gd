extends Node2D

@onready var button: Button = $Button

func _ready() -> void:
	button.pressed.connect(_on_start)

func _on_start() -> void:
	SceneTransitionNode.change_scene("res://levels/intro/intro.tscn")
