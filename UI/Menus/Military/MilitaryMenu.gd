extends NinePatchRect

@onready var globals = get_node("/root/Global")

var armyScene : Resource = preload("res://Dynamic Items/Armies/army_static.tscn")

var playerNationName : String = ""

var armyRaisedFlag : bool = false

signal militaryMenuOpened
signal militaryMenuClosed
signal mouseInMilitaryMenu
signal mouseLeftMilitaryMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerNationName = globals.regionsDict[globals.playerNation][0]
	close()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta : float) -> void:
	pass
	
func open() -> void:
	visible = true
	emit_signal("militaryMenuOpened")
	pass

func close() -> void:
	visible = false
	emit_signal("militaryMenuClosed")
	pass

func _on_exit_menu_pressed() -> void:
	close()
	pass # Replace with function body.

func _on_raise_army_pressed() -> void:
	if !armyRaisedFlag:
		var nationData : NationData = load("res://Nations/" + playerNationName + ".tres")
		for armyComp in nationData.armiesComp:
			var armySprite : Sprite2D = armyScene.instantiate()
			armySprite.armyData = armyComp
			get_node("/root/World/Sprites/" + playerNationName).add_child(armySprite)
			armySprite.position = Vector2(globals.regionsDict[globals.playerNation][1][0], 
				globals.regionsDict[globals.playerNation][1][1])
	pass # Replace with function body.

func _on_mouse_entered() -> void:
	emit_signal("mouseInMilitaryMenu")
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	emit_signal("mouseLeftMilitaryMenu")
	pass # Replace with function body.
