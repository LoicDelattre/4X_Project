extends MarginContainer

@onready var menusNode = $MenusPanel/MenusUI
@onready var timeNode = $TimePanel/TimeUI
@onready var tileInfoNode = $TileInfoUI

var isMouseInMenuUI : bool = false
var isMouseInTimeUI : bool = false
var isMouseinTileInfoUI : bool = false

signal mouseEnteredUI
signal mouseLeftUI

# Called when the node enters the scene tree for the first time.
func _ready():
	menusNode.connect("mouseInMenu", _on_mouse_enter_menuUI)
	menusNode.connect("mouseLeftMenu", _on_mouse_left_menuUI)
	
	timeNode.connect("mouseInTimeUI", _on_mouse_enter_timeUI)
	timeNode.connect("mouseLeftTimeUI", _on_mouse_left_timeUI)
	
	tileInfoNode.connect("mouseInTileInfoUI", _on_mouse_enter_tileUI)
	tileInfoNode.connect("mouseLeftTileInfoUI", _on_mouse_left_tileUI)
	
	pass # Replace with function body.

func _on_mouse_enter_menuUI():
	emit_signal("mouseEnteredUI")
	isMouseInMenuUI = true
	pass
	
func _on_mouse_left_menuUI():
	print("left menu")
	isMouseInMenuUI = false
	_on_mouse_left_UI()
	pass
	
func _on_mouse_enter_timeUI():
	emit_signal("mouseEnteredUI")
	isMouseInTimeUI = true
	pass
	
func _on_mouse_left_timeUI():
	print("left time")
	isMouseInTimeUI = false
	_on_mouse_left_UI()
	pass
	
func _on_mouse_enter_tileUI():
	emit_signal("mouseEnteredUI")
	isMouseinTileInfoUI = true
	pass
	
func _on_mouse_left_tileUI():
	print("left tile info")
	isMouseinTileInfoUI = false
	_on_mouse_left_UI()
	pass

func _on_mouse_left_UI():
	if !isMouseInMenuUI and !isMouseInTimeUI and !isMouseinTileInfoUI:
		emit_signal("mouseLeftUI")
	pass
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
