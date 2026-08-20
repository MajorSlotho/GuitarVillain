extends CanvasGroup

func _ready():
	ChangeHP(0,load("res://Sprites/HealthSymbol1.svg"))
	ChangeHP(1,load("res://Sprites/HealthSymbol1.svg"))
	ChangeHP(2,load("res://Sprites/HealthSymbol1.svg"))

func _process(_delta):
	match (AutoLoader.Health):
		5: ChangeHP(0,load("res://Sprites/HealthSymbol2.svg"))
		4: ChangeHP(0,load("res://Sprites/HealthSymbol3.svg"))
		3: ChangeHP(1,load("res://Sprites/HealthSymbol2.svg"))
		2: ChangeHP(1,load("res://Sprites/HealthSymbol3.svg"))
		1: ChangeHP(2,load("res://Sprites/HealthSymbol2.svg"))
		0: ChangeHP(2,load("res://Sprites/HealthSymbol3.svg"))


func ChangeHP(NoteNum: int,NewTexture: CompressedTexture2D):
	get_child(NoteNum).texture = NewTexture
