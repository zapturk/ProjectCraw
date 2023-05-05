extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("battleStart"):
		startBattle()
	if Input.is_action_just_pressed("battleEnd"):
		endBattle()

func startBattle():
	Global.inBattle = true
	$Monster.visible = false
	$MonsterHP.visible = false
	var monster = MonsterStats.getMonster(randi_range(0,2))
	
	
	# set up monster
	$Monster.frame = monster.id
	$MonsterHP/Name.text = monster.name
	$MonsterHP/Level.text = monster.level
	$MonsterHP/HP.value = (monster.hp / monster.hp) * 100
	
	
	visible = true
	$AnimationPlayer.play("BattleBox")
	await  $AnimationPlayer.animation_finished
	$Monster.visible = true
	$MonsterHP.visible = true
	

func endBattle():
	visible = false
	$AnimationPlayer.play("RESET")
	Global.inBattle = false
