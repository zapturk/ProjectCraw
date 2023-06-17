extends Node2D

@onready var Selector = $BattleMenu/Selector

var attackOption: Vector2 = Vector2(-74, -9)
var skillOption: Vector2 = Vector2(-74, -1)
var fleeOption: Vector2 = Vector2(-74, 7)
var monsterCurrentHP = 0.0

enum state {
	READY,
	BATTLEACTION,
	HIDDEN
}

var currenState = state.HIDDEN
var monster

# Called when the node enters the scene tree for the first time.
func _ready():
	Selector.position = attackOption
	visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if currenState == state.READY and visible:
		if Input.is_action_just_pressed("ui_up"):
			moveSelectorUp()
		if Input.is_action_just_pressed("ui_down"):
			moveSelectorDown()
		if Input.is_action_just_pressed("ui_accept"):
				currenState = state.BATTLEACTION
				battleActions()

func startBattle():
	Global.inBattle = true
	$Monster.visible = false
	$MonsterHP.visible = false
	$BattleMenu.visible = false
	
	# just dose a random monster may need to adjust as you level up
	monster = MonsterStats.getMonster(randi_range(0,26))
	
	# set up monster
	$Monster.frame = monster.id
	$MonsterHP/Name.text = monster.name
	$MonsterHP/Level.text = monster.level
	monsterCurrentHP = monster.hp
	$MonsterHP/HP.value = (monsterCurrentHP / monster.hp) * 100
	Selector.position = attackOption
	updateHpAndMp()
	
	visible = true
	$AnimationPlayer.play("BattleBox")
	await $AnimationPlayer.animation_finished
	$Monster.visible = true
	$MonsterHP.visible = true
	$BattleMenu.visible = true
	currenState = state.READY
	
func battleActions():
	var pos: Vector2 = Selector.position
	if(pos.is_equal_approx(attackOption)):
		if(PlayerStats.spe >= monster.spe):
			playerAttack()
			if $MonsterHP/HP.value > 0.0:
				monsterAttack()
		else:
			monsterAttack()
			playerAttack()
	elif(pos.is_equal_approx(skillOption)):
		currenState = state.READY
	elif(pos.is_equal_approx(fleeOption)):
		if randi_range(0,3) == 1:
			endBattle()
		else:
			cantExcape()

func updateHpAndMp():
	$BattleMenu/HP.text = "HP: " + str(PlayerStats.currentHp) + "/" + str(PlayerStats.hp)
	$BattleMenu/MP.text = "MP: " + str(PlayerStats.currentMp) + "/" + str(PlayerStats.mp)

func cantExcape():
	Selector.position = attackOption
	$Textbox.QueueText("Can't excape.")
	await Signal($Textbox, 'textDone')
	currenState = state.READY

func playerAttack():
	var damage:int = (PlayerStats.att - monster.def) * randf_range(.8, 1.2)
	$Textbox.QueueText("You did " + str(damage) + " to " + monster.name + ".")
	monsterCurrentHP -= damage
	$MonsterHP/HP.value = (monsterCurrentHP / monster.hp) * 100.0
	
	if $MonsterHP/HP.value <= 0.0:
		$Textbox.QueueText("You defeated " + monster.name + ".")
		await Signal($Textbox, 'textDone')
		endBattle()
	else:
		await Signal($Textbox, 'textDone')
		currenState = state.READY

func monsterAttack():
	var damage:int = (monster.att - PlayerStats.def) * randf_range(.9, 1.1)
	if damage < 0:
		damage = 0
	$Textbox.QueueText(monster.name + " did " + str(damage) + " to you.")
	PlayerStats.currentHp -= damage
	updateHpAndMp()
#	$MonsterHP/HP.value = (monsterCurrentHP / monster.hp) * 100.0
	
	if $MonsterHP/HP.value <= 0.0:
		$Textbox.QueueText("You defeated " + monster.name + ".")
		await Signal($Textbox, 'textDone')
		endBattle()
	else:
		await Signal($Textbox, 'textDone')
		currenState = state.READY

func runFromBattle():
	$Textbox.QueueText("You got away safely!")
	await Signal($Textbox, 'textDone')
	endBattle()

func endBattle():
	visible = false
	currenState = state.HIDDEN
	$AnimationPlayer.play("RESET")
	Global.inBattle = false
	
func moveSelectorDown():
	var pos: Vector2 = Selector.position
	if(pos.is_equal_approx(attackOption)):
		Selector.position = skillOption
	elif(pos.is_equal_approx(skillOption)):
		Selector.position = fleeOption
	elif(pos.is_equal_approx(fleeOption)):
		Selector.position = attackOption
	
func moveSelectorUp():
	var pos: Vector2 = Selector.position
	if(pos.is_equal_approx(attackOption)):
		Selector.position = fleeOption
	elif(pos.is_equal_approx(skillOption)):
		Selector.position = attackOption
	elif(pos.is_equal_approx(fleeOption)):
		Selector.position = skillOption
	
