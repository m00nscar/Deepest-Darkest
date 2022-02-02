extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var SmokeParticlePlay = $Smoke
onready var LeafParticlePlay = $Leaves
onready var TransitionPlay =$Transition/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	
	SmokeParticlePlay.emitting = true
	LeafParticlePlay.emitting = true
	TransitionPlay.play("fade")
	MusicController.reset_volume()
	MusicController.play_OlderThanTheHills()
	#pass # Replace with function body.
func _on_Door_body_entered(body):
	TransitionPlay.play("fade")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
