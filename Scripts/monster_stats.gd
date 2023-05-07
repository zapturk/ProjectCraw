extends Node

var monsterList = []



# Called when the node enters the scene tree for the first time.
func _ready():
	monsterList.append({
		"id": 0,
		"name": "Octopus", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 1,
		"name": "Harpy", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 2,
		"name": "Stallion", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 3,
		"name": "Carp", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 4,
		"name": "Orthrus", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 5,
		"name": "Gecko", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 6,
		"name": "Slime", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 7,
		"name": "Crab", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 8,
		"name": "Nessie", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 9,
		"name": "Neko", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 10,
		"name": "LadyBird", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 11,
		"name": "Rex", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 12,
		"name": "Roo", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 13,
		"name": "Ghost", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 14,
		"name": "Spike", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 15,
		"name": "Mammoth", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 16,
		"name": "Mhorros", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 17,
		"name": "Naga", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 18,
		"name": "Moth", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 19,
		"name": "Muskrat", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 20,
		"name": "Hat-trick", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 21,
		"name": "Chimp", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 22,
		"name": "Shell", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 23,
		"name": "Bull", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 24,
		"name": "Onion", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 25,
		"name": "Beetle", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})
	
	monsterList.append({
		"id": 26,
		"name": "frog", 
		"hp": 3, 
		"level": "1", 
		"att": 5,
		"def": 3,
		"spe": 2, 
		"exp": 1,
		"skills": []
	})

func getMonster(id: int):
	return monsterList[id]
