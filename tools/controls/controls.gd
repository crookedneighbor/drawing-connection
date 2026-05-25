class_name Controls extends CanvasGroup

@onready var restart_button: Button = $Restart
@onready var credits: Button = $Credits

func _ready() -> void:
	restart_button.button_down.connect(_on_restart_pressed)
	credits.button_down.connect(_on_credits_pressed)

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://the_end.tscn")
