extends TileMap

@onready var map: TileMap = get_parent().get_node("TileMap")

func _ready():
	visible = true

func clearCell(location: Vector2i, dir: Vector2i):
	# Center
	erase_cell(0, location)
	
	# 1 in front
	erase_cell(0, location + dir)
