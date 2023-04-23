extends TileMap

@onready var map: TileMap = get_parent().get_node("TileMap")

func _ready():
	visible = true
#	pass

func clearCell(location: Vector2i, dir: Vector2i):
	# Center
	erase_cell(0, location)
	
	# 1 in front
	erase_cell(0, location + Vector2i.UP)
	erase_cell(0, location + Vector2i.UP + Vector2i.RIGHT)
	erase_cell(0, location + Vector2i.UP + Vector2i.LEFT)
	erase_cell(0, location + Vector2i.RIGHT)
	erase_cell(0, location +  Vector2i.LEFT)
	
	erase_cell(0, location + Vector2i.DOWN)
	erase_cell(0, location + Vector2i.DOWN + Vector2i.RIGHT)
	erase_cell(0, location + Vector2i.DOWN + Vector2i.LEFT)
