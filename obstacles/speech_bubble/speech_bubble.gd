class_name SpeechBubble extends Obstacle

@onready var label: RichTextLabel = $Sprite2D/RichTextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var reveal_area: Area2D = $"Reveal Area"

@export var text: String

func _ready() -> void:
	label.text = text
	reveal_area.area_entered.connect(_on_close_to_speech)

func _on_close_to_speech(area: Area2D) -> void:
	if area.get_parent() is DrawnLine:
		animation_player.play("reveal")
