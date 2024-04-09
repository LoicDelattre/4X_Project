extends Control

var isOpen:bool = false
@onready var mapNode : NinePatchRect = get_node("/root/World/map")
@onready var titleNode : Label = $Background/InfoLayout/TitleGroup/Title
@onready var taxAmountNode : Label =  $"Background/InfoLayout/Main Stats/Tax/Value"
@onready var manpowerAmountNode : Label =  $"Background/InfoLayout/Main Stats/Manpower/Value"
# Called when the node enters the scene tree for the first time.
func _ready():
	mapNode.connect("tileOnMapSelected", open)
	close()
	pass

func open(tileName:String):
	#tileName used to get data about that tile
	var tileData : TileCharacteristics = load("res://ProvincesData/" + tileName + ".tres")
	titleNode.set_text(tileName)
	taxAmountNode.set_text(str(tileData.get_baseTax()))
	manpowerAmountNode.set_text(str(tileData.get_manpower()))
	visible = true
	isOpen = true

func close():
	visible = false
	isOpen = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_button_pressed():
	close()
	pass # Replace with function body.
