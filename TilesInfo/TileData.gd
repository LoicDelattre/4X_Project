extends Resource
class_name TileCharacteristics

@export var title : String = ""
@export var manpower : int = 0
@export var baseTax : int = 0
@export var population: int = 0
@export var tileID : int = 0



func get_tileID() -> int:
	return tileID

func get_title() -> String:
	return title
	
func get_manpower() -> int:
	return manpower
	
func set_manpower(newManpower:int) -> void:
	manpower = newManpower
	pass

func get_population() -> int:
	return population
	
func set_population(newPopulation:int) -> void:
	population = newPopulation
	pass
	
func get_baseTax() -> int:
	return baseTax
	
func set_baseTax(newBaseTax:int) -> void:
	baseTax = newBaseTax
	pass
