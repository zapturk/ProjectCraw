extends Area2D

var tileSize = 16
@onready var fog = get_parent().get_node("Fog")

# Called when the node enters the scene tree for the first time.
func _ready():
	fog.clearCell(currentPos(), currentPos())

func currentPos():
	return Vector2i((position.x - 8)/tileSize, (position.y - 8)/tileSize)
