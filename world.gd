extends Node2D

@export_range(1, 5) var simSpeed:int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func simUpdate(delta:float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in simSpeed:
		simUpdate(delta)
	pass
