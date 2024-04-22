extends Node2D

signal mouseOnSprite
signal mouseLeftSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_mouse_on_sprite() -> void:
	emit_signal("mouseOnSprite")
	pass
	
func _on_mouse_left_sprite() -> void:
	emit_signal("mouseLeftSprite")
	pass

func _on_child_entered_tree(node):
	if node.is_class("Node2D"):
		node.connect("mouseOnSprite", _on_mouse_on_sprite)
		node.connect("mouseLeftSprite", _on_mouse_left_sprite)
	pass # Replace with function body.
