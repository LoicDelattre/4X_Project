extends Control

@onready var worldNode = get_node("/root/World")
@onready var spritesNode = get_node("/root/World/Sprites")
@onready var soldiersAmountNode = $"Background/InfoLayout/Main Stats/Manpower/Value"
@onready var archersAmountNode = $"Background/InfoLayout/Main Stats/Tax/Value"

var soldiersAmount : int = 0
var archersAmount : int = 0
var cavalryAmount : int = 0

signal mouseInArmyInfoUI
signal mouseLeftArmyInfoUI
signal infoTabClosed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	worldNode.connect("tileOnMapSelected", close)
	close(false)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func open(spriteData : Array) -> void:
	visible = true
	soldiersAmount = spriteData[0][0]
	archersAmount = spriteData[0][1]
	
	soldiersAmountNode.text = str(soldiersAmount)
	archersAmountNode.text = str(archersAmount)
	pass

func close(externalOrder : bool) -> void:
	visible = false
	if !externalOrder:
		emit_signal("infoTabClosed")
	pass

func _on_exit_button_pressed() -> void:
	close(false)
	pass # Replace with function body.
	

func _on_background_mouse_entered() -> void:
	emit_signal("mouseInArmyInfoUI")
	pass # Replace with function body.


func _on_background_mouse_exited() -> void:
	emit_signal("mouseLeftArmyInfoUI")
	pass # Replace with function body.
