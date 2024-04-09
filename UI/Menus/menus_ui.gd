extends Control

@onready var militaryMenu : NinePatchRect = $HBoxContainer/MilitaryPanel/Military

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_military_button_pressed():
	militaryMenu.open()
	pass # Replace with function body.
