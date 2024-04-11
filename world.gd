extends Node2D

@onready var globals = get_node("/root/Global")

signal tileOnMapSelected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func onTileClicked(tileName : String) -> void:
	emit_signal("tileOnMapSelected", tileName)
	pass

func _on_regions_child_entered_tree(node):
	if node.is_class("Area2D"):
		node.connect("tileClicked", onTileClicked)
	pass # Replace with function body.
