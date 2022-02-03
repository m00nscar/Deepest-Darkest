extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var TransitionPlay = $Transition/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	TransitionPlay.play("fade")
	MusicController.reset_volume()
	MusicController.turn_up_volume()
	MusicController.play_Luke()
	


	
		
		

