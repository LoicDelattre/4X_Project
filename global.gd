extends Node

@export_range(1,5) var gameSpeed : int = 3
var gameIteration : int = 1

var gameSpeedChange : bool = false

var overlayMapMode : int = 0
var mapModes : Array = ["Countries", "Military"]

var regionsDict : Dictionary = {
	"#2f3699" : ["France", [0,0]],
	"#22b14c" : ["Portugal", [0,0]],
	"#ffc20e" : ["Spain", [0,0]]
}

var playerNation : String = "#2f3699"

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
