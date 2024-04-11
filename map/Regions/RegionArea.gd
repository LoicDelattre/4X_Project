extends Area2D

var regionName : String = ""

var mouseInTile:bool = false

var shape:Polygon2D
var collision:CollisionPolygon2D
var regionData : TileCharacteristics 
var baseColor : Color = Color(0.7, 0.7, 0.7, 1)

signal tileClicked

func _ready():
	pass

func _on_child_entered_tree(node):
	if node.is_class("Polygon2D"):
		if FileAccess.file_exists("res://map/ProvincesData/" + regionName + ".tres"):
			regionData = load("res://map/ProvincesData/" + regionName + ".tres")
			baseColor = regionData.color
	
		shape = $ProvinceShape
		shape.set_color(baseColor)
	pass # Replace with function body.

func _mouse_enter():
	shape.set_color(Color(0, 1, 0, 0.2))
	mouseInTile = true

func _mouse_exit():
	shape.set_color(baseColor)
	mouseInTile = false
	
func _input(event):
	if event is InputEventMouseButton and mouseInTile and event.is_action_pressed("left_click"):
		emit_signal("tileClicked", regionName)
		#open tile info screen

