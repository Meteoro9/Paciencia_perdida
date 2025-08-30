extends Node2D
class_name Shoot_Spawner_Controller

var is_shoot_able:bool = false
@export var timer: Timer
@export var shoot: PackedScene
var shoot_direction
var player


func _ready():
	player = get_tree().get_first_node_in_group("Player")
	is_shoot_able = true

# Dispara en cualquier parte de la pantalla con clic derecho
func _unhandled_input(event: InputEvent) -> void:
	if not is_shoot_able:
		return
	
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_RIGHT \
	and event.pressed:
		# posición global del mouse
		var mouse_global := get_global_mouse_position()
		var player_pos = player.global_position
		var dir = (mouse_global - player_pos).normalized()
		
		var bullet := shoot.instantiate() as Shoot_Behaviour
		bullet.global_position = player_pos
		bullet.setup(dir)

		# Podés agregarla al árbol raíz de la escena actual
		get_tree().current_scene.add_child(bullet)
		# o como hijo del spawner si preferís:
		# add_child(bullet)

		# cooldown
		is_shoot_able = false
		timer.start()

		print("Se disparó un bullet")



# Si terminó el cooldown, permite disparar
func _on_timer_timeout() -> void:
	is_shoot_able = true
