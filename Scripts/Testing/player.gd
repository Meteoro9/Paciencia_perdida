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


func animation_selector():
	if health > 70.0: 
		# Esperamos a que la animación actual termine
		# Y luego reproducimos la siguiente
		await animation.animation_finished
		animation.play("idle")
		
	elif health > 15.0 and health <= 70.0:
		await  animation.animation_finished
		animation.play("distraido")
		
	else:
		await animation.animation_finished
		animation.play("desesperado")


func _on_area_entered(body) -> void:
	if body.name == "Distraction":
		audio_player.play()
	
