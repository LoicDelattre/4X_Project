extends Control

var isOpen:bool = false
@onready var worldNode : Node2D = get_node("/root/World")
@onready var menusNode : Control = get_node("/root/World/CanvasLayerUI/UI/MenusPanel/MenusUI")

@onready var bgNode : NinePatchRect = $Background
@onready var exitButtonNode : Button = $Background/InfoLayout/TitleGroup/VBoxContainer/ExitButton
@onready var titleNode : Label = $Background/InfoLayout/TitleGroup/Panel/Title
@onready var taxAmountNode : Label =  $"Background/InfoLayout/Main Stats/Tax/Value"
@onready var manpowerAmountNode : Label =  $"Background/InfoLayout/Main Stats/Manpower/Value"

signal mouseInTileInfoUI
signal mouseLeftTileInfoUI

# Called when the node enters the scene tree for the first time.
func _ready():
	worldNode.connect("tileOnMapSelected", open)
	menusNode.connect("menuOpened", _on_menu_open)
	close()
	pass

func open(tileName:String):
	#tileName used to get data about that tile
	var tileData : TileCharacteristics = load("res://map/ProvincesData/" + tileName + ".tres")
	titleNode.set_text(tileName)
	taxAmountNode.set_text(str(tileData.get_baseTax()))
	manpowerAmountNode.set_text(str(tileData.get_manpower()))
	
	visible = true
	isOpen = true

func close():
	visible = false
	isOpen = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta : float):
	pass

func _on_menu_open():
	close()
	pass

func _on_exit_button_button_down():
	close()
	pass # Replace with function body.

func _on_background_mouse_entered():
	emit_signal("mouseInTileInfoUI")
	pass # Replace with function body.

func _on_background_mouse_exited():
	emit_signal("mouseLeftTileInfoUI")
	pass # Replace with function body.
