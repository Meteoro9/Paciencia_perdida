extends Area2D
class_name Shoot_Behaviour

var speed := 500.0
var direction: Vector2 = Vector2.ZERO


# En el spawner se configura la dirección
func setup(dir: Vector2):
	direction = dir
	rotation = direction.angle()

# Si shoca una distracción la elimina
func _on_area_entered(body) -> void:
	# Para variaciones de distracción hay que actualizar a comparación:
	if body.name == "Distraction":
		print("Disparo eliminó una distracción")
		body.queue_free()
		queue_free()
	

# Para que los disparos no permanezcan en escena ocupando memoria:
func _on_timer_timeout() -> void:
	queue_free()

func _physics_process(delta: float):
	if direction != Vector2.ZERO:
		global_position += direction * speed * delta
