extends Area2D
class_name Player

#var player_position:Vector2 
var health:float = 100
const initial_health:float = 100
signal health_changed
@export var audio_player: AudioStreamPlayer2D
@export var animation: AnimatedSprite2D

func _init():
	health = initial_health

func take_damage(damage:float):
	if damage > health:
		health = 0
		print("Jugador perdió")
	else:
		health -= damage
		print("El jugador recibió " + str(damage) + " daño y ahora tiene " + str(health))
	emit_signal("health_changed") # el segundo parámetro es el objeto señalado
	
	animation_selector()

func _process(_delta: float) -> void:
	animation_selector()


func animation_selector():
	var new_animation: String
	
	if health > 70.0:
		new_animation = "idle"
	elif health > 15.0 and health <= 70.0:
		new_animation = "distraido"
	else:
		new_animation = "desesperado"
	
	# Solo reproduce la animación si no es la que ya se está reproduciendo
	if animation.animation != new_animation:
		animation.play(new_animation)


func _on_area_entered(body) -> void:
	if body.name == "Distraction":
		audio_player.play()
	
