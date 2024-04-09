extends NinePatchRect

signal militaryMenuOpened
signal militaryMenuClosed

# Called when the node enters the scene tree for the first time.
func _ready():
	close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func open() -> void:
	visible = true
	emit_signal("militaryMenuOpened")
	pass

func close() -> void:
	visible = false
	emit_signal("militaryMenuClosed")
	pass

func _on_exit_menu_pressed():
	close()
	pass # Replace with function body.


func _on_recruit_soldier_pressed():
	pass # Replace with function body.
