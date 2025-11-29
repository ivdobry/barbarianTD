extends Path3D

@export var enemy_scene: PackedScene
@export var dificulty_manager: Node

@onready var timer: Timer = $Timer

func _spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = dificulty_manager.get_enemy_healt()
	add_child(new_enemy)
	timer.wait_time = dificulty_manager.get_spawn_time()
	new_enemy.tree_exited.connect(_enemy_defeated)

func _on_difficulty_manager_stop_spawning_enemies() -> void:
	timer.stop()

func _enemy_defeated() -> void:
	if timer.is_stopped():
		for child in get_children():
			if child is PathFollow3D:
				return
				
		print("you won")
