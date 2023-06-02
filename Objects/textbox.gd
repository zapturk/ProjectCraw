extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textboxContainer = $"TextboxContainer"
@onready var endSymble = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var text = $TextboxContainer/MarginContainer/HBoxContainer/Text
@onready var tween = create_tween()
signal textDone

enum state {
	READY,
	READING,
	FINISHED
}

@export var currenState = state.READY
var textQueue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	HideTextbox()
#	QueueText("The quick brown fox jumps over the lazy dog!")
#	QueueText("Next set of text.")
#	QueueText("Last set of text.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match currenState:
		state.READY:
			if !textQueue.is_empty():
				DisplayText()
		state.READING:
			if Input.is_action_just_pressed("ui_accept"):
				tween.stop()
				text.visible_ratio = 1
				ChangeState(state.FINISHED)
		state.FINISHED:
			endSymble.text = "v"
			if Input.is_action_just_pressed("ui_accept"):
				ChangeState(state.READY)
				HideTextbox()
				
func QueueText(nextText: String):
	textQueue.push_back(nextText)

func HideTextbox():
	text.text = ""
	endSymble.text = ""
	textboxContainer.hide()
	textDone.emit()
	

func ShowTextbox():
	textboxContainer.show()

func DisplayText():
	ShowTextbox()
	text.visible_ratio = 0
	text.text = textQueue.pop_front()
	ChangeState(state.READING)
	tween = create_tween()
	tween.tween_property(text, "visible_ratio", 1.0, CHAR_READ_RATE * len(text.text))
	await tween.finished
	ChangeState(state.FINISHED)
	
func ChangeState(nextState: state):
	currenState = nextState
	match currenState:
		state.READY:
			print("READY")
		state.READING:
			print("READING")
		state.FINISHED:
			print("FINISHED")
