class_name ConnectorDot extends Area2D

signal started
signal found

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

# possible states: 
# * ready
# * waiting
# * connected 
var state: String = "ready"
var entered: bool = false

func _ready() -> void:
	mouse_entered.connect(_on_mouse_enter)
	mouse_exited.connect(_on_mouse_exit)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if state == "ready" and entered:
			anim.play("dismiss_ready")
			connected()
			started.emit()

func _on_mouse_enter() -> void:
	if state == "waiting":
		connected()
		
	entered = true

func _on_mouse_exit() -> void:
	entered = false

func connected() -> void:
	mouse_entered.disconnect(_on_mouse_enter)
	mouse_exited.disconnect(_on_mouse_exit)
	state = "connected"
	found.emit()
	anim.play("connected")
	audio.play()

func waiting() -> void:
	state = "waiting"
	anim.play("dismiss_ready")
	await anim.animation_finished
	anim.play("waiting")
