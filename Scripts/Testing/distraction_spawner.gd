extends Node2D
class_name Distraction_Spawner

@export var distracion1: PackedScene
@onready var timer: Timer = $Timer
var player
@export var time_to_timer: float

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	timer.one_shot = true
	timer.start(time_to_timer)

func _on_timer_timeout() -> void:
	spawn_distraction()
	timer.start(time_to_timer)


func spawn_distraction():
	var radius = 300.0 # distancia fija desde el monje
	var angle = randf_range(0, TAU) # TAU = 2*PI
	
	# Elige una posición aleatoria
	var spawn_pos = player.global_position + Vector2(cos(angle), sin(angle)) * radius
	
	# Instanciar la escena y guardarla:
	var distraction_instance = distracion1.instantiate()
	# Modificar su posición:
	distraction_instance.global_position = spawn_pos
	get_tree().current_scene.add_child(distraction_instance)
