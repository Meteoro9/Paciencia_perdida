extends CanvasLayer
class_name Title_Scene_Behaviour

@export var level1 : PackedScene
@export var level2 : PackedScene
@export var level3 : PackedScene
@export var level4 : PackedScene

func on_level1_button_pressed():
	#get_tree().change_scene_to_file("res://Scenes/Levls_&_Screens/Pantalla de título.tscn")
	get_tree().change_scene_to_file("res://Scenes/nivel_test.tscn")
 
func on_level2_button_pressed():
	pass

func on_level3_button_pressed():
	pass

func on_level4_button_pressed():
	pass
