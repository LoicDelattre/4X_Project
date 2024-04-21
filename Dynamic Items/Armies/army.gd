extends Sprite2D

var soldiers : int = 0
var cavalry : int = 0
var archers : int = 0

var armyName : String = ""

var generalName : String = ""

var armyData : Array = []

var mouseOnSprite : bool = false

signal spriteClicked
signal mouseInSprite
signal mouseLeftSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
func _process(delta: float) -> void:
	pass
	
func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton and mouseOnSprite and event.is_action_pressed("left_click"):
		emit_signal("spriteClicked", "army", armyData)

func _on_contour_mouse_entered() -> void:
	mouseOnSprite = true
	emit_signal("mouseInSprite")
	pass # Replace with function body.

func _on_contour_mouse_exited() -> void:
	mouseOnSprite = false
	emit_signal("mouseLeftSprite")
	pass # Replace with function body.
