extends Node2D
var Speed = 1
var StringNum = 0
var Overlap = false

func _ready():
	Speed = AutoLoader.GameSpeed
	
func _process(_delta):
	position.y += 3 * Speed
	if Overlap:
		match StringNum:
			4: if Input.is_action_just_pressed("String1"):
				AddScore()
			8: if Input.is_action_just_pressed("String2"):
				AddScore()
			16: if Input.is_action_just_pressed("String3"):
				AddScore()
			32: if Input.is_action_just_pressed("String4"):
				AddScore()
				
	if AutoLoader.GameEnd:
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	StringNum = area.collision_layer
	Overlap = true
	
	if area.collision_layer == 2: ##Note missed
		AutoLoader.DropCombo()
		AutoLoader.Health -= 1
		queue_free()
		
func _on_area_2d_area_exited(_area: Area2D) -> void:
	Overlap = false
	
func AddScore():
	AutoLoader.Score()
	queue_free()
