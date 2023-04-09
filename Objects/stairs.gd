extends Area2D

@export_enum("ui_up", "ui_right", "ui_down", "ui_left") var SpawnLocation: String
@export var Partner: Area2D
@export var DownStairs: bool
@onready var Collider = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if DownStairs:
		$Sprite2D.frame = 1
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
