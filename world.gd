extends Node2D

@onready var globals = get_node("/root/Global")
@onready var sprites : Node2D = $Sprites

signal tileOnMapSelected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for country in globals.regionsDict:
		var nationNode : Node2D = load("res://Nations/NationSprites.tscn").instantiate()
		nationNode.name = globals.regionsDict[country][0]
		sprites.add_child(nationNode)		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func onTileClicked(tileName : String) -> void:
	emit_signal("tileOnMapSelected", tileName)
	pass

func _on_regions_child_entered_tree(node : Node):
	if node.is_class("Area2D"):
		node.connect("tileClicked", onTileClicked)
	pass # Replace with function body.

