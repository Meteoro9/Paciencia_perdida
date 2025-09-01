extends Area2D
class_name Bomb_Behaviour

@export var bomb_input: Node2D
@export var bomb_animation: AnimationPlayer
@export var bomb_collision: CollisionShape2D
@export var sprite: Sprite2D
@export var audio: AudioStreamPlayer2D

func _process(_delta: float) -> void:
	if bomb_input.is_bomb_exploding:
		audio.play()
		sprite.visible = true
		bomb_animation.play("explote")
		bomb_input.is_bomb_exploding = false
	



func _on_area_entered(body) -> void:
	if not bomb_collision.disabled:
		if body.name == "Distraction":
			body.queue_free()
	
