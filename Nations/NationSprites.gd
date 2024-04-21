extends Node2D

signal spriteAdded
signal spriteClicked
signal mouseOnSprite
signal mouseLeftSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_sprite_clicked(spriteType: String, spriteData : Array) -> void:
	emit_signal("spriteClicked", spriteType, spriteData)
	pass

func on_mouse_entered_sprite() -> void:
	emit_signal("mouseOnSprite")
	pass
	
func on_mouse_left_sprite() -> void:
	emit_signal("mouseLeftSprite")
	pass

func _on_child_entered_tree(node: Node) -> void:
	if node.is_class("Sprite2D"):
		node.connect("spriteClicked", on_sprite_clicked)
		node.connect("mouseInSprite", on_mouse_entered_sprite)
		node.connect("mouseLeftSprite", on_mouse_left_sprite)
		emit_signal("spriteAdded")
	pass # Replace with function body.
