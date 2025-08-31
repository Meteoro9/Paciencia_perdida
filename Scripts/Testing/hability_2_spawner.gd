extends Node2D
class_name Shoot_Spawner_Controller

var is_shoot_able:bool = false
@export var timer: Timer
@export var shoot: PackedScene
var shoot_direction
var player

@export var animation_player: AnimationPlayer
@export var audio: AudioStreamPlayer2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	is_shoot_able = true

# Dispara con clic derecho
func _unhandled_input(event: InputEvent) -> void:
	if not is_shoot_able:
		return
	
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_RIGHT \
	and event.pressed:
		audio.play()
		
		# posición global del mouse
		var mouse_global := get_global_mouse_position()
		var player_pos = player.global_position
		var dir = (mouse_global - player_pos).normalized()
		
		var bullet := shoot.instantiate() as Shoot_Behaviour
		bullet.global_position = player_pos
		bullet.setup(dir)
		# Se agrega a la la escena como nodo hijo
		get_tree().current_scene.add_child(bullet)
		
		
		# cooldown
		is_shoot_able = false
		timer.start()
		animation_player.play("shoot_used")
		
		print("Se disparó un bullet")



# Si terminó el cooldown, permite disparar
func _on_timer_timeout() -> void:
	is_shoot_able = true
	animation_player.play("shoot_recharged")
