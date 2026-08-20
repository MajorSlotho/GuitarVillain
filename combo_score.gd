extends Node2D
var score = 0
var combo = 0
var NumberOfNotes = 0

func _process(_delta):
	get_node("ComboCount").text = str(combo)
	score = combo * NumberOfNotes

func Score():
	combo += 1
	NumberOfNotes += 1
	print(str(combo))
	
func DropCombo():
	combo = 0
	pass
