class_name SpeechBubble extends Obstacle

@onready var label: RichTextLabel = $RichTextLabel

@export var text: String

func _ready() -> void:
	label.text = text
