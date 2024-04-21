extends MarginContainer

@onready var menusNode = $MenusPanel/MenusUI
@onready var timeNode = $TimePanel/TimeUI
@onready var tileInfoNode = $TileInfoUI
@onready var armyInfoNode = $ArmyInfo

var isMouseInMenuUI : bool = false
var isMouseInTimeUI : bool = false
var isMouseInTileInfoUI : bool = false
var isMouseOnSprite : bool = false
var isMouseInArmyInfoUI : bool = false

signal mouseEnteredUI
signal mouseLeftUI
signal mouseOnSprite
signal mouseLeftSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	menusNode.connect("mouseInMenu", _on_mouse_enter_menuUI)
	menusNode.connect("mouseLeftMenu", _on_mouse_left_menuUI)
	
	timeNode.connect("mouseInTimeUI", _on_mouse_enter_timeUI)
	timeNode.connect("mouseLeftTimeUI", _on_mouse_left_timeUI)
	
	tileInfoNode.connect("mouseInTileInfoUI", _on_mouse_enter_tileUI)
	tileInfoNode.connect("mouseLeftTileInfoUI", _on_mouse_left_tileUI)
	
	armyInfoNode.connect("mouseInArmyInfoUI", _on_mouse_enter_armyUI)
	armyInfoNode.connect("mouseLeftArmyInfoUI", _on_mouse_left_armyUI)
	
	pass # Replace with function body.

func _on_mouse_enter_menuUI():
	emit_signal("mouseEnteredUI")
	isMouseInMenuUI = true
	pass
	
func _on_mouse_left_menuUI():
	isMouseInMenuUI = false
	_on_mouse_left_UI()
	pass
	
func _on_mouse_enter_timeUI():
	emit_signal("mouseEnteredUI")
	isMouseInTimeUI = true
	pass
	
func _on_mouse_left_timeUI():
	isMouseInTimeUI = false
	_on_mouse_left_UI()
	pass
	
func _on_mouse_enter_tileUI():
	emit_signal("mouseEnteredUI")
	isMouseInTileInfoUI = true
	pass
	
func _on_mouse_left_tileUI():
	isMouseInTileInfoUI = false
	_on_mouse_left_UI()
	pass
	
func _on_mouse_enter_armyUI():
	emit_signal("mouseEnteredUI")
	isMouseInArmyInfoUI = true
	pass
	
func _on_mouse_left_armyUI():
	isMouseInArmyInfoUI = false
	_on_mouse_left_UI()
	pass

func _on_mouse_left_UI():
	if !isMouseInMenuUI and !isMouseInTimeUI and !isMouseInTileInfoUI and !isMouseInArmyInfoUI:
		emit_signal("mouseLeftUI")
	pass
 
func _on_sprite_clicked(spriteType : String, spriteData : Array) -> void:
	if spriteType == "army":
		armyInfoNode.open(spriteData)
	pass
	
func _on_mouse_enter_sprite():
	emit_signal("mouseOnSprite")
	pass
	
func _on_mouse_left_sprite():
	emit_signal("mouseLeftSprite")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_sprites_child_entered_tree(node: Node) -> void:
	if node.is_class("Node2D"):
		node.connect("spriteClicked", _on_sprite_clicked)
		node.connect("mouseOnSprite", _on_mouse_enter_sprite)
		node.connect("mouseLeftSprite", _on_mouse_left_sprite)
	pass # Replace with function body.
