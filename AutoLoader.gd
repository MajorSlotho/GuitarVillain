extends Node
var score = 0
var combo: int = 0
var NumberOfNotes = 0
signal SendCombo
var GameSpeed = 1
var Health = 6
var GameEnd = false

func Score():
	combo += 1
	NumberOfNotes += 1
	score = combo + 1 * NumberOfNotes
	emit_signal("SendCombo")

func DropCombo():
	combo = 0
	emit_signal("SendCombo")
	if Health <= 0:
		get_tree().change_scene_to_file("res://main_menu.tscn")
		ResetGame()

func ResetGame():
	NumberOfNotes = 0
	Health = 7
	GameSpeed = 1
