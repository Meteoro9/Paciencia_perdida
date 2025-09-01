extends CanvasLayer
class_name Win_Timer_Behaviour

const default_timer: float = 120.0
var win_timer: float
@export var timer_bar: ProgressBar

# SE ASIGNA EN CADA NIVEL A MANO:
@export var player_node: NodePath
@onready var player = get_node(player_node)

var current_time: float

func _ready() -> void:
	win_timer = default_timer

func _process(delta: float) -> void:
	# Comparamos tiempo para dar victoria o derrota
	compare_timer_win_loose(delta)
	
	timer_bar.value = win_timer
	
	current_time = timer_bar.value

func compare_timer_win_loose(delta):
	if win_timer > 0:
		win_timer -= delta
		print(win_timer)
		
		if player.health <= 0:
			loose_level()
			
	else:
		print("Se acabó el tiempo")
		win_level()
	

func loose_level():
	pass

func win_level():
	pass
