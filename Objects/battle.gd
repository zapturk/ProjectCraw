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
	var monster: int = randi_range(0,27)
	$Monster.frame = monster
	
	visible = true
	$AnimationPlayer.play("BattleBox")
	await  $AnimationPlayer.animation_finished
	$Monster.visible = true
	

func endBattle():
	visible = false
	$AnimationPlayer.play("RESET")
	Global.inBattle = false
