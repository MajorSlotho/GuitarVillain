extends Node2D
var MyNode = preload	("res://Notes/red_note.tscn")
var Speed = 1
var Buffer = false

func _ready():
	Speed = AutoLoader.GameSpeed
	$Timer.wait_time = 0.5 + 2* randf() / Speed
	$Timer.start()
	Buffer = true 		##Timer.time_left starts at 0, so a buffer is needed

func _process(_delta):
	if $Timer.time_left == 0 and Buffer == true:
		SummonNote()
		$Timer.wait_time = 0.8 + randf() / Speed
		$Timer.start()
			
func _on_timer_timeout():
	SummonNote()
	$Timer.wait_time = 1 + randf() / Speed

func SummonNote():	
	var Instance = MyNode.instantiate()
	add_child(Instance)
