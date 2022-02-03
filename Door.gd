tool

extends Area2D

#onready var TransitionPlay = $Transition/AnimationPlayer

export(String, FILE) var next_scene_path = ""



func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "next_scene path must be set for the portal to work"
	else:
		return ""


func _on_Door_body_entered(body):
	#TransitionPlay.play("fade")
	MusicController.turn_down_volume()
	if get_tree().change_scene(next_scene_path) != OK:
		print("Error: Unavailable scene!") # Replace with function body.
