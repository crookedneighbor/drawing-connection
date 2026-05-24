class_name Controls extends CanvasGroup

signal restart

@onready var restart_button: Button = $Restart

func _ready() -> void:
	restart_button.button_down.connect(_on_restart_pressed)

func _on_restart_pressed() -> void:
	restart.emit()
