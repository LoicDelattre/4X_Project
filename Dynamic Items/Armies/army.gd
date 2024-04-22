extends Sprite2D

var soldiers : int = 0
var cavalry : int = 0
var archers : int = 0

var armyName : String = ""

var generalName : String = ""

var armyData : Array = []

var mouseOnSprite : bool = false
var spriteSelected : bool = false

@onready var armyInfoNode : Control = get_node("/root/World/CanvasLayerUI/UI/ArmyInfo")
@onready var shadowNode : Polygon2D = $Shadow
@onready var contourNode : Sprite2D = $Selected

signal spriteClicked
signal spriteDoubleClicked
signal mouseInSprite
signal mouseLeftSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shadowNode.visible = false
	contourNode.visible = false
	
	armyInfoNode.connect("infoTabClosed", unselect)
	
	loadData()
	pass # Replace with function body.


func loadData() -> void:
	var armyComp : Array = armyData[0]
	soldiers = armyComp[0] 
	archers = armyComp[1]
	cavalry = armyComp[2]
	armyName = armyData[1]
	generalName = armyData[2][0]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton and mouseOnSprite and event.is_action_pressed("left_click"):
		if !spriteSelected:
			emit_signal("spriteClicked", "army", armyData)
			contourNode.visible = true
			spriteSelected = true
		else:
			emit_signal("spriteDoubleClicked", "army")
			unselect()
			
func unselect() -> void:
	spriteSelected = false
	contourNode.visible = false		
	pass

func _on_contour_mouse_entered() -> void:
	mouseOnSprite = true
	shadowNode.visible = true
	emit_signal("mouseInSprite")
	pass # Replace with function body.

func _on_contour_mouse_exited() -> void:
	mouseOnSprite = false
	shadowNode.visible = false
	emit_signal("mouseLeftSprite")
	pass # Replace with function body.
