extends Node

@export_range(1,5) var gameSpeed : int = 3
var gameIteration : int = 1
var gameSpeedChange : bool = false

var playerNationID : int = 0
var nationsID : Array = ["Spectator", "Iceland", "Norway", "Sweden", "Finland", "Russia", "Ireland", "United Kingdom",
						"Danemark", "Lithuania", "Latvia", "Estonia", "France", "Belgium", "Netherlands", "Germany", 
						"Poland"]

signal simulationUpdate
signal gameSpeedChanged

func get_gameIteration() -> int:
	return gameIteration
	
func set_gameIteration(iter : int) -> void:
	gameIteration = iter
	pass
	
func get_gameSpeed() -> int:
	return gameSpeed
	
func set_gameSpeed(speed : int) -> void:
	gameSpeed = speed

	gameSpeedChange = true
	emit_signal("gameSpeedChanged", speed)
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func simUpdate(delta:float) -> void:
	gameIteration += 1
	emit_signal("simulationUpdate", gameIteration)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in gameSpeed:
		if !gameSpeedChange:
			simUpdate(delta)
		else:
			gameSpeedChange = false
			break
	pass
