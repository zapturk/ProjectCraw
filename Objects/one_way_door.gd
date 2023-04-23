extends Area2D

@export_enum("up", "right", "down", "left") var dir: String = "up"

# Called when the node enters the scene tree for the first time.
func _ready():
	match dir:
		"up":
			$Sprite2D.frame = 1
			$Ray.target_position = Vector2.DOWN * 16
		"right":
			$Sprite2D.frame = 2
			$Ray.target_position = Vector2.LEFT * 16
		"left":
			$Sprite2D.frame = 0
			$Ray.target_position = Vector2.RIGHT * 16
		"down":
			$Sprite2D.frame = 3
			$Ray.target_position = Vector2.UP * 16


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
