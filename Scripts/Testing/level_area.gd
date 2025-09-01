extends Area2D
class_name Elimination_Area_Behaviour

@export var audio_exit: AudioStreamPlayer2D
@export var animation: AnimatedSprite2D


func _on_area_exited(body):
	if body.name == "Distraction":
		print("Se fue una distracción del área")
		
		animation.play("default")
		audio_exit.play()
		body.queue_free()
		await audio_exit.finished
		
	else:
		print("Qué chucha salió???!!!")
	pass # Replace with function body.
