extends Node2D
class_name Nivel1

@export var health_bar: CanvasLayer
@export var win_timer: CanvasLayer

func compare_conditions():
	if health_bar.current_value <= 0:
		#get_tree().change_scene_to_file("res://Scenes/Levels_&_Screens/nivel_1.tscn")
		pass
	elif win_timer.current_time <= 0:
		get_tree().change_scene_to_file("res://Scenes/Levels_&_Screens/pantalla_victoria.tscn")
		pass
