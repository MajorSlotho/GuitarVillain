extends Label

func _ready():
	AutoLoader.SendCombo.connect(_on_autoloader_send_combo)

func _process(_delta):
	pass

func _on_autoloader_send_combo() -> void:
	self.text = "Combo: " + str(AutoLoader.combo)
