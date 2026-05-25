class_name Controls extends CanvasGroup

@onready var restart_button: Button = $Restart
@onready var credits: Button = $Credits

func _ready() -> void:
	restart_button.button_down.connect(_on_restart_pressed)
	credits.button_down.connect(_on_credits_pressed)

func _on_restart_pressed() -> void:
	SceneTransitionNode.change_scene("res://main.tscn")

func _on_credits_pressed() -> void:
	SceneTransitionNode.change_scene("res://the_end.tscn")
