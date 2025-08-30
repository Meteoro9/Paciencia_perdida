extends Node2D
class_name Shoot_Spawner_Controller

var is_shoot_able:bool = false
@export var timer: Timer
@export var shoot: PackedScene
var shoot_direction
var player


func _ready():
	player = get_tree().get_first_node_in_group("Player")

# Para detectar el input y bloquear el disparo después de disparar:
func _input_event(viewport, event, shape_idx):
	if is_shoot_able:
		if event  is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
			# Almacenamos posición del clic
			shoot_direction = event.position
			
			# Activamos cooldown
			timer.start()
			is_shoot_able = false
			
			# Instanciamos disparo
			var bullet_shoot = shoot.instantiate()
			
			# Posicionamos disparo en jugador
			bullet_shoot.global_position = player.global_position
			
			# Configuramos dirección de disparo
			bullet_shoot.setup(shoot_direction)
			
			# Añadimos disparo como hijo del spawner
			add_child(bullet_shoot)
			
			# Corroboramos que funciona
			print("Se disparó un bullet")
			

# Si terminó el cooldown, permite disparar
func _on_timer_timeout() -> void:
	is_shoot_able = true

func _process(_delta):
	pass
