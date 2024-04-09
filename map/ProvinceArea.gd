extends Area2D

var mouseInTile:bool = false

var shape:Polygon2D
var collision:CollisionPolygon2D

signal tileClicked

func _ready():
	shape = $ProvinceShape
	shape.set_color(Color(0, 0, 0, 0))
	collision = $ProvinceCollision
	
	collision.set_polygon(shape.get_polygon())
	pass

func _mouse_enter():
	shape.set_color(Color(0, 1, 0, 0.2))
	mouseInTile = true

func _mouse_exit():
	shape.set_color(Color(0, 0, 0, 0))
	mouseInTile = false
	
func _input(event):
	if event is InputEventMouseButton and mouseInTile and event.is_action_pressed("left_click"):
		emit_signal("tileClicked", self.name)
		#open tile info screen
