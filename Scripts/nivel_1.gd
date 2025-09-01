extends Node2D
class_name Nivel1

@export var health_bar: CanvasLayer
@export var win_timer: CanvasLayer

func compare_conditions():
	if health_bar.current_value <= 0:
		# Sin vida -> Pantalla de derrota
		get_tree().change_scene_to_file("res://Scenes/Levels_&_Screens/pantalla_derrota.tscn")
		
	elif win_timer.current_time <= 0:
		# Si se acaba el tiempo -> Gana:
		get_tree().change_scene_to_file("res://Scenes/Levels_&_Screens/pantalla_victoria.tscn")
