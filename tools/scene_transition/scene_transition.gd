class_name SceneTransition extends CanvasLayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func change_scene(level: String) -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	await get_tree().create_timer(.5).timeout
	get_tree().change_scene_to_file(level)
	animation_player.play_backwards("fade")
