extends Control

var isOpen:bool = false
@onready var mapNode : NinePatchRect = get_node("/root/World/map")

# Called when the node enters the scene tree for the first time.
func _ready():
	mapNode.connect("tileOnMapSelected", open)
	close()
	pass

func open(tileName:String):
	#tileName used to get data about that tile
	print(tileName)
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
