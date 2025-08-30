extends Area2D
class_name Shoot_Behaviour

var speed := 200.0
var direction: Vector2

# En el spawner se configura la dirección
func setup(dir: Vector2):
	direction = dir

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
