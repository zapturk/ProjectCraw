extends TileMap

func _ready():
	visible = true

func clearCell(location: Vector2i):
	# Center
	erase_cell(0, location)
	
	# Top
	erase_cell(0, location + Vector2i.UP)
	
	# Right
	erase_cell(0, location + Vector2i.RIGHT)
	
	# Down
	erase_cell(0, location + Vector2i.DOWN)
	
	# Left
	erase_cell(0, location + Vector2i.LEFT)
	
