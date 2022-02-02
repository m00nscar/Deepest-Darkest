extends CanvasLayer


onready var textbox_container = $TextboxContainer
onready var end_symbol = $TextboxContainer/MarginContainer/End
onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label2



var dialog = [
	"Uncle Pen's Record Collection:",
	"Tony Rice - Church Street Blues",
	"Flatt & Scruggs - At Carnegie Hall",
	"The Byrds - Sweetheart of the Rodeo"
]



var area_entered = null

var dialog_index = 0
var finished = false

func _ready():
	hide_textbox()

func _process(delta):
	end_symbol.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		label.text = dialog[dialog_index]
		label.percent_visible = 0
		$Tween.interpolate_property(
			label, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	#return  #PLAY WITH THIS
	dialog_index += 1



func _on_TriggerRecordPlayer_body_entered(body):
	area_entered=true
	show_textbox()
	load_dialog()
	#load_dialog()
	#nextPhrase()



func _on_TriggerRecordPlayer_body_exited(body):
	area_entered=false
	finished = true
	dialog_index = 0
	hide_textbox() # Replace with function body.


func hide_textbox():
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()

func show_textbox():
	textbox_container.show()
	end_symbol.text = "v"



func _on_Tween_tween_all_completed():
	finished=true

