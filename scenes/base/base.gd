extends Node3D

@export var max_health: int = 5 
@onready var label_3d: Label3D = $Label3D

var _current_health: int:
	set(health_in):
		_current_health = health_in
		label_3d.text = str(_current_health) + "/" + str(max_health)
		var red = Color.RED
		var white = Color.WHITE
		label_3d.modulate = red.lerp(white, float(_current_health) / float(max_health))
		if _current_health < 1:
			_death()
		
func _ready() -> void:
	_current_health = max_health

func take_damage() -> void:
	_current_health -= 1

func _death() -> void:
	get_tree().reload_current_scene()
