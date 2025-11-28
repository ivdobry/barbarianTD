extends Path3D

@export var enemy_scene: PackedScene


func _spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)

func _on_timer_timeout() -> void:
	_spawn_enemy()
