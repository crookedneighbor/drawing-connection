extends Node2D

@onready var teeth_top: Obstacle = $MonsterTeethTop

func start() -> void:
	await get_tree().create_timer(5).timeout

	var tween = create_tween()
	var shake = 3
	var shake_duration = 0.1
	var shake_count = 10

	for i in shake_count:
		tween.tween_property(teeth_top, "position", Vector2(randf_range(-shake, shake), randf_range(-shake, shake)), shake_duration)

	tween.tween_property(teeth_top, "position", Vector2(0, 50), 1)
	# TODO if completed before this event finishes, get an achievement
