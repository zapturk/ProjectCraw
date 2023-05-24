extends Node2D

@onready var Selector = $BattleMenu/Selector

var attackOption: Vector2 = Vector2(-74, -9)
var skillOption: Vector2 = Vector2(-74, -1)
var fleeOption: Vector2 = Vector2(-74, 7)

enum state {
	READY,
	TEXTBOX,
	HIDDEN
}

var currenState = state.HIDDEN

# Called when the node enters the scene tree for the first time.
func _ready():
	Selector.position = attackOption
	visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currenState == state.READY:
		if Input.is_action_just_pressed("ui_up"):
			moveSelectorUp()
		if Input.is_action_just_pressed("ui_down"):
			moveSelectorDown()
		if Input.is_action_just_pressed("ui_accept"):
				currenState == state.TEXTBOX
				battleActions()

func startBattle():
	Global.inBattle = true
	$Monster.visible = false
	$MonsterHP.visible = false
	$BattleMenu.visible = false
	
	# just dose a random monster may need to adjust as you level up
	var monster = MonsterStats.getMonster(randi_range(0,26))
	
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
	$BattleMenu.visible = true
	currenState = state.READY
	
func battleActions():
	var pos: Vector2 = Selector.position
	if(pos.is_equal_approx(attackOption)):
		pass
	elif(pos.is_equal_approx(skillOption)):
		pass
	elif(pos.is_equal_approx(fleeOption)):
		if randi_range(0,3) == 1:
			endBattle()
		else:
			Selector.position = attackOption
			$Textbox.QueueText("Can't excape.")
			currenState = state.READY

func endBattle():
	$Textbox.QueueText("You got away safely!")
	visible = false
	$AnimationPlayer.play("RESET")
	Global.inBattle = false
	currenState = state.HIDDEN
	
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
	
