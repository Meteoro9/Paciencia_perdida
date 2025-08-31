extends CanvasLayer

# SE ASIGNA EN CADA NIVEL A MANO:
@export var player_node: NodePath
@onready var player = get_node(player_node)

func _process(_delta):
	$TextureProgressBar.value = player.health
