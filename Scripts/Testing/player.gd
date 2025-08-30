extends Area2D
class_name Player

#var player_position:Vector2 
var health:float = 100
const initial_health:float = 100
signal health_changed

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
