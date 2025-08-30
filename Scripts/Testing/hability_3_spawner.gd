extends Node2D
class_name Bomb_Spawner

var is_bomb_able:bool = false
var is_bomb_exploding: bool = false
@export var timer: Timer
var player

@export var animation_player: AnimationPlayer
@export var bomb_animation: AnimationPlayer

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	is_bomb_able = true


func _process(_delta) -> void:
	# Si la bomba está cargada y se presionó input
	if is_bomb_able:
		if Input.is_action_just_pressed("bomb_action"):
			# Se activa la variable pública para Bomb_active
			is_bomb_exploding = true
			await bomb_animation.current_animation
			is_bomb_able = false
			timer.start()


func _on_timer_timeout() -> void:
	is_bomb_able = true
	
	pass # Replace with function body.
