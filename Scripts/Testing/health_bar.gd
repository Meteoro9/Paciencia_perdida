extends CanvasLayer

# SE ASIGNA EN CADA NIVEL A MANO:
@export var player_node: NodePath
@onready var player = get_node(player_node)
var current_value: float

func _process(_delta):
	#$TextureProgressBar.value = player.health
	$ProgressBar.value = player.health
	current_value = $ProgressBar.value
	if current_value <= 0:
		get_tree().change_scene_to_file("res://Scenes/Levels_&_Screens/pantalla_derrota.tscn")
