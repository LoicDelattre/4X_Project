extends Control

@onready var globalNode : Node = get_node("/root/Global")
@onready var dateNode : Label = $"Background/Time Display/Date/Panel/Label"
@onready var gameSpeed : int = globalNode.get_gameSpeed()

var gameSpeedsTitles : Array = ["Slowest", "Slow", "Normal", "Fast", "Fastest"]
var months : Array = ["January", "February", "March", "April", "May", "June", "July", "August", 
					"September", "October", "November", "December"]
var longMonths : Array = ["January", "March", "May", "July", "August", "October"]
var shortMonths : Array = ["April", "June", "September", "November"]

var day : int = 1
var month : int = 0
var year : int = 2000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	globalNode.connect("simulationUpdate", timeInfoUpdate)
	
	setLabelText()
	updateDate()
	pass # Replace with function body.

func timeInfoUpdate(gameIteration : int) -> void:
	#at 60 fps and slowest speed, 1 day = 1 sec
	if gameIteration*sqrt(gameSpeed)*2 >= 60:
		globalNode.set_gameIteration(0)
		setLabelText()
		updateDate()
	pass
	
func updateDate() -> void:
	if months[month] in longMonths and day == 31:
		day = 1
		month += 1
	elif months[month] in shortMonths and day == 30:
		day = 1
		month += 1
	elif month == 1 and day == 28:
		day = 1
		month += 1
	elif month == 11 and day == 31:
		year += 1
		day = 1
		month = 0
	else:
		day += 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setLabelText() -> void:
	dateNode.text = gameSpeedsTitles[gameSpeed-1] + ", " + str(day) + " " + months[month] + " " + str(year)
	pass

func _on_slowest_pressed() -> void:
	gameSpeed = 1
	globalNode.set_gameSpeed(gameSpeed)
	setLabelText()
	pass # Replace with function body.


func _on_slow_pressed() -> void:
	gameSpeed = 2
	globalNode.set_gameSpeed(gameSpeed)
	setLabelText()
	pass # Replace with function body.


func _on_normal_pressed() -> void:
	gameSpeed = 3
	globalNode.set_gameSpeed(gameSpeed)
	setLabelText()
	pass # Replace with function body.


func _on_fast_pressed() -> void:
	gameSpeed = 4
	globalNode.set_gameSpeed(gameSpeed)
	setLabelText()
	pass # Replace with function body.


func _on_fastest_pressed() -> void:
	gameSpeed = 5
	globalNode.set_gameSpeed(gameSpeed)
	setLabelText()
	pass # Replace with function body.
