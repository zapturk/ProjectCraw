extends Area2D

var tileSize = 16
var moving = false
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}
@onready var ray: RayCast2D = $RayCast2D
@onready var fog = get_parent().get_node("Fog")

var lastDir = inputs["ui_up"]


# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tileSize)
	position += Vector2.ONE * tileSize/2
	fog.clearCell(currentPos(), Vector2i(lastDir))
	
func _physics_process(_delta):
	if moving or Global.inBattle:
		return
		
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			await move(dir)
	if Input.is_action_just_pressed("ui_accept"):
		interact()
		
	for body in get_overlapping_areas():
		match body.get_collision_layer():
			Global.movingTileLayer:
				await move(body.dir)
			Global.stairsLayer:
				var partner = body.Partner
				
				# turn off colition
				partner.Collider.disabled = true
				
				# teleport player
				position = partner.position
				fog.clearCell(currentPos(), Vector2i(inputs[lastDir]))
				
				# turn player
				await move(partner.SpawnLocation)
				
				# turn off colition
				partner.Collider.disabled = false
			_:
				pass
	

func interact():
	var obj = ray.get_collider()
	
	if obj != null && obj.get_class() == "Area2D":
		match obj.get_collision_layer():
			Global.doorLayer:
				moving = true
				obj.get_node("AnimationPlayer").play("DoorOpen")
				await obj.get_node("AnimationPlayer").animation_finished
				await movePlayer(lastDir, 2)
				obj.get_node("AnimationPlayer").play("DoorClose")
			Global.oneWayDoorLayer:
				if obj.get_node("Ray").is_colliding():
					moving = true
					obj.get_node("AnimationPlayer").play("DoorOpen")
					await obj.get_node("AnimationPlayer").animation_finished
					await movePlayer(lastDir, 2)
					obj.get_node("AnimationPlayer").play("DoorClose")
			Global.movingTileLayer:
				movePlayer(lastDir, 2)
			Global.treasureLayer:
				obj.OpenTreasure()
			_:
				pass

func move(dir: String):
	$AnimationPlayer.play("idle_" + dir)
	lastDir = dir
	ray.target_position = inputs[dir] * tileSize
	ray.force_raycast_update()
	if !ray.is_colliding():
		await movePlayer(dir)
		
		# see if there is a randon encounter
		if randi_range(1,255) < 25:
			$Battle.startBattle()
	else:
		fog.clearCell(currentPos(), Vector2i(inputs[lastDir]))

func movePlayer(dir, numOftimes = 1):
	for x in numOftimes:
		$AnimationPlayer.play(dir)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position + inputs[dir] * tileSize, 1.0/4).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		fog.clearCell(currentPos(), Vector2i(inputs[lastDir]))
		$AnimationPlayer.play("idle_" + dir)
		moving = false
		
func currentPos():
	return Vector2i((position.x - 8)/tileSize, (position.y - 8)/tileSize)
