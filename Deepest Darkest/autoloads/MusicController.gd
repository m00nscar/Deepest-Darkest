extends Node

var OlderThanTheHills = load("res://Music and Sounds/Older Than The Hills.wav")
var Luke = load("res://Music and Sounds/mando drums (1).wav")


func _ready():
	pass # Replace with function body.


func play_OlderThanTheHills():
	
	$Music.stream = OlderThanTheHills
	$Music.play()
	
func play_Luke():
	
	$Music.stream = Luke
	$Music.play()


func turn_down_volume():
	$Music.volume_db = -12

func turn_up_volume():
	$Music.volume_db = 6

func reset_volume():
	$Music.volume_db = 0

