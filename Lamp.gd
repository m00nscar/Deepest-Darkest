extends StaticBody2D

onready var light2D = $Light2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var on_body = null



func _ready():
	print("on") # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_on_off") and on_body==true and light2D.visible ==false:
		light2D.show()
	elif Input.is_action_just_pressed("ui_on_off") and on_body==true and light2D.visible ==true:
		light2D.hide()

func _on_TriggerLamp_body_entered(body):
	on_body = true 

func _on_TriggerLamp_body_exited(body):
	on_body = false
