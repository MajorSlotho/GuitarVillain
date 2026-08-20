extends Node2D
var config = ConfigFile.new()

func _ready():
	config.load("res://GameSave.cfg")
	SaveScore()
	
func _on_start_button_button_down():
	get_tree().change_scene_to_file("res://GuitarVillain.tscn")

func _on_speed_slider_value_changed(value):
	AutoLoader.GameSpeed = $SpeedSlider.value
	$SpeedSlider/SpeedLabel.text = "Game Speed"+str($SpeedSlider.value)

func SaveScore():
	if config.get_value("X","Highscore") > AutoLoader.score:
		$HighscoreLabel.text = "Highscore: "+str(config.get_value("X","Highscore"))
	else:
		$HighscoreLabel.text = "Highscore: "+str(AutoLoader.score)
		config.set_value("X","Highscore", AutoLoader.score)
		config.save("res://GameSave.cfg")

func _on_exit_button_pressed():
	get_tree().quit()

func _on_score_reset_button_pressed() -> void:
	config.set_value("X","Highscore", 0)
	config.save("res://GameSave.cfg")
	$HighscoreLabel.text = "Highscore: 0"
