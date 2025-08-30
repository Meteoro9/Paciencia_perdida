extends Area2D

func _on_area_exited(body):
	if body.name == "Distraction":
		print("Se fue una distracción del área")
		body.queue_free()
	else:
		print("Qué chucha salió???!!!")
	pass # Replace with function body.
