extends Resource
class_name TileCharacteristics

@export var title : String = ""
@export var manpower : int = 0
@export var baseTax : int = 0
@export var basePops : Array = [0.0, 0.0, 0.0] #poor, middle, wealthy
@export var genPopIncrease : float = 0
@export var tileID : int = 0

var pops : Array = [0.0, 0.0, 0.0]

func get_tileID() -> int:
	return tileID

func get_title() -> String:
	return title
	
func get_manpower() -> int:
	return manpower
	
func set_manpower(newManpower:int) -> void:
	manpower = newManpower
	pass
	
func get_baseTax() -> int:
	return baseTax
	
func set_baseTax(newBaseTax:int) -> void:
	baseTax = newBaseTax
	pass
