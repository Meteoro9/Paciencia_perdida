extends Area2D
class_name Distraction_Behaviour

var speed := 130
var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")


func _on_area_entered(body):
	if body.name == "Player":
		body.take_damage(5)
		print("distracción se fue")
		queue_free()

# Segundo comportamiento (_process abajo)

var dragging := false
var drag_offset = Vector2.ZERO

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Comienza arrastre
			dragging = true
			drag_offset = global_position - event.position
		

func _process(delta):
	if player: # Parte 1
		var direction = (player.global_position - global_position).normalized()
		global_position += direction * speed * delta
	
	if dragging: # Parte 2
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			global_position = get_global_mouse_position() + drag_offset
		else: # Se soltó clic y termina el arrastre
			dragging = false
