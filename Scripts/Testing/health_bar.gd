extends CanvasLayer

# SE ASIGNA EN CADA NIVEL A MANO:
@export var player_node: NodePath
@onready var player = get_node(player_node)
var current_value: float

func _process(_delta):
	#$TextureProgressBar.value = player.health
	$ProgressBar.value = player.health
	current_value = $ProgressBar.value
