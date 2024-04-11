extends Control

var isOpen:bool = false
@onready var worldNode : Node2D = get_node("/root/World")
@onready var bgNode : NinePatchRect = $Background
@onready var exitButtonNode : Button = $Background/InfoLayout/TitleGroup/VBoxContainer/ExitButton
@onready var titleNode : Label = $Background/InfoLayout/TitleGroup/Panel/Title
@onready var taxAmountNode : Label =  $"Background/InfoLayout/Main Stats/Tax/Value"
@onready var manpowerAmountNode : Label =  $"Background/InfoLayout/Main Stats/Manpower/Value"

# Called when the node enters the scene tree for the first time.
func _ready():
	worldNode.connect("tileOnMapSelected", open)
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
	
	exitButtonNode.mouse_filter = Control.MOUSE_FILTER_STOP
	bgNode.mouse_filter = Control.MOUSE_FILTER_STOP

func close():
	visible = false
	isOpen = false
	
	exitButtonNode.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bgNode.mouse_filter = Control.MOUSE_FILTER_IGNORE 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_button_button_down():
	close()
	pass # Replace with function body.
