extends Control

# test area that need to be deleted at some point

# Player stats
var playerLvl: int = 1
var playerHP: float = 100
var playerMP: float = 50
var playerAtk = 10
var playerDef = 5

# Enemy stats
var monsterLvl: int= 1
var monsterHP: float = 50
var monsterAtk = 8
var monsterDef = 3

# test area delete
var monsterCurrentHP: float = 0
var playerCurrentHP: float = 0
@onready var MonsterHPBar = $MonsterHP/HP
@onready var PlayerHPBar = $PlayerHP/HP
@onready var Selector = $BattleMenu/Selector

var attackOption: Vector2 = Vector2(-74, -9)
var skillOption: Vector2 = Vector2(-74, -1)
var fleeOption: Vector2 = Vector2(-74, 7)
var acting: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	# set the mosters HP bar 
	monsterCurrentHP = monsterHP
	MonsterHPBar.value = monsterCurrentHP / monsterHP * 100.0
	$MonsterHP/Level.text = str(monsterLvl)
	# TODO: Set the Monsters name
	
	# set the player HP bar 
	playerCurrentHP = playerHP
	PlayerHPBar.value = playerCurrentHP / playerHP * 100.0
	$PlayerHP/Level.text = str(playerLvl)
	$Player/AnimationPlayer.play("idle")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		moveSelectorUp()
	if Input.is_action_just_pressed("ui_down"):
		moveSelectorDown()
	if Input.is_action_just_pressed("ui_accept"):
		await doAction()
		
	# update hp bars
	PlayerHPBar.value = playerCurrentHP / playerHP * 100.0
	MonsterHPBar.value = monsterCurrentHP / monsterHP * 100.0

func doAction():
	var pos: Vector2 = Selector.position
	if(pos.is_equal_approx(attackOption)):
		monsterAttack()
		playerAttack()
	elif(pos.is_equal_approx(skillOption)):
		pass
	elif(pos.is_equal_approx(fleeOption)):
		pass

func monsterAttack():
	var damage = (monsterAtk - playerDef) * randf_range(.9, 1.1)
	playerCurrentHP -= damage

func playerAttack():
	$Player/AnimationPlayer.play("Attack")
	await $Player/AnimationPlayer.animation_finished
	var damage = (playerAtk - monsterDef) * randf_range(.9, 1.1)
	monsterCurrentHP -= damage
	$Player/AnimationPlayer.play("idle")

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
	
