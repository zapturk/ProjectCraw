extends Node

var monsterList = []



# Called when the node enters the scene tree for the first time.
func _ready():
	# Octopus
	monsterList.append({
		"id": 0,
		"name": "Octopus", # Monster Name
		"hp": 20, # Monster Total HP
		"level": "5", # Monster Level
		"def": 5, # Monster Defence
		"att": 6# Monster Attack
	})
	
	monsterList.append({
		"id": 1,
		"name": "Harpy", # Monster Name
		"hp": 10, # Monster Total HP
		"level": "3", # Monster Level
		"def": 2, # Monster Defence
		"att": 1# Monster Attack
	})


func getMonster(id: int):
	return monsterList[id]
