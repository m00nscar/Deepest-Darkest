extends CanvasLayer

const CHAR_READ_RATE = 0.05

onready var textbox_container = $MarginContainer
onready var label = $TextboxContainer/MarginContainer/Panel/Label


enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
#var text_queue = []

func _process(delta):
	match current_state:
		State.READY:
			pass
		State.READING:
			if Input.is_action_pressed("ui_accept"):
				label.percent_visible = 1.0
				
				change_state(State.FINISHED)
			if Input.is_action_pressed("ui_up"):
				label.percent_visible = 1.0
				
				change_state(State.FINISHED)
			if Input.is_action_pressed("ui_left"):
				label.percent_visible = 1.0
				
				change_state(State.FINISHED)
			if Input.is_action_pressed("ui_right"):
				label.percent_visible = 1.0
				
				change_state(State.FINISHED)
			if Input.is_action_pressed("ui_down"):
				label.percent_visible = 1.0
				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_pressed("ui_accept"):
				change_state(State.READY)
				hide_textbox()
			if Input.is_action_pressed("ui_up"):
				change_state(State.READY)
				hide_textbox()
			if Input.is_action_pressed("ui_left"):
				change_state(State.READY)
				hide_textbox()
			if Input.is_action_pressed("ui_right"):
				change_state(State.READY)
				hide_textbox()
			if Input.is_action_pressed("ui_down"):
				change_state(State.READY)
				hide_textbox()

func _ready():
	print("Starting State: State.READY")
	hide_textbox() # Replace with function body.
	#add_text("This text is going to be added")

func hide_textbox():

	textbox_container.hide()

func show_textbox():

	textbox_container.show()

func add_text(next_text):

	change_state(State.READING)
	show_textbox()




func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")






func _on_TriggerLamp_body_entered(body):
	show_textbox() 

func _on_TriggerLamp_body_exited(body):
	change_state(State.FINISHED)


func _on_TriggerLightbulb_body_entered(body):
	show_textbox() # Replace with function body.


func _on_TriggerLightbulb_body_exited(body):
	change_state(State.FINISHED)
