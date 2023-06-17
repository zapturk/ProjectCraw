extends Node

@onready var playerName = "Octopus" 
@onready var hp = randi_range(18, 24)
@onready var currentHp = hp
@onready var mp = 0
@onready var currentMp = mp
@onready var level = 1 
@onready var att = randi_range(8, 12)
@onready var def = randi_range(2, 4)
@onready var spe = randi_range(4, 6) 
@onready var exp = 0
@onready var skills = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
