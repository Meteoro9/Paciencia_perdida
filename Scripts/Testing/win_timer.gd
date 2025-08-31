extends CanvasLayer
class_name Win_Timer_Behaviour

const default_timer: float = 120.0
var win_timer: float
@export var timer_bar: ProgressBar

# SE ASIGNA EN CADA NIVEL A MANO:
@export var player_node: NodePath
@onready var player = get_node(player_node)


func _ready() -> void:
	win_timer = default_timer

func _process(delta: float) -> void:
	win_timer -= delta # restamos tiempo
	print(win_timer)
	timer_bar.value = win_timer
	
	# Comparamos tiempo para dar victoria o derrota

func compare_timer_win_loose():
	if win_timer <= 0:
		print("Se acabó el tiempo")
	pass
