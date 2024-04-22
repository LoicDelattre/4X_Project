extends Control

@onready var militaryMenu : NinePatchRect = $HBoxContainer/MilitaryPanel/Military

signal mouseInMenu
signal mouseLeftMenu
signal menuOpened

# Called when the node enters the scene tree for the first time.
func _ready():
	militaryMenu.connect("mouseInMilitaryMenu", _on_menus_bg_mouse_entered)
	militaryMenu.connect("mouseLeftMilitaryMenu", _on_menus_bg_mouse_exited)
	militaryMenu.connect("militaryMenuOpened", _on_menu_opened)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_menu_opened():
	emit_signal("menuOpened")

func _on_military_button_pressed():
	militaryMenu.open()
	pass # Replace with function body.
	
func _on_menus_bg_mouse_entered():
	emit_signal("mouseInMenu")
	pass # Replace with function body.

func _on_menus_bg_mouse_exited():
	emit_signal("mouseLeftMenu")
	pass # Replace with function body.
