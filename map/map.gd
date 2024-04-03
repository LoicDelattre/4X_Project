extends NinePatchRect

signal tileOnMapSelected

@onready var franceNode : Area2D = $France

# Called when the node enters the scene tree for the first time.
func _ready():
	franceNode.connect("tileClicked", openInfoTab)
	pass # Replace with function body.

func openInfoTab(tileName:String):
	emit_signal("tileOnMapSelected", tileName)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
