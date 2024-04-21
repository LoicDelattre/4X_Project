extends Area2D

@onready var nodeUI = get_node("/root/World/CanvasLayerUI/UI")

var regionName : String = ""

var mouseInTile:bool = false
var mouseInUI:bool = false
var mouseOnSprite : bool = false

var shape:Polygon2D
var collision:CollisionPolygon2D
var regionData : TileCharacteristics 
var baseColor : Color = Color(0.7, 0.7, 0.7, 1)

signal tileClicked

func _ready() -> void:
	nodeUI.connect("mouseEnteredUI", _mouse_in_UI)
	nodeUI.connect("mouseLeftUI", _mouse_left_UI)
	nodeUI.connect("mouseOnSprite", _mouse_on_sprite)
	nodeUI.connect("mouseLeftSprite", _mouse_left_sprite)
	pass

func _mouse_on_sprite() -> void:
	mouseOnSprite = true
	pass

func _mouse_left_sprite() -> void:
	mouseOnSprite = false
	pass

func _on_child_entered_tree(node : Node2D) -> void:
	if node.is_class("Polygon2D"):
		if FileAccess.file_exists("res://map/ProvincesData/" + regionName + ".tres"):
			regionData = load("res://map/ProvincesData/" + regionName + ".tres")
			baseColor = regionData.color
	
		shape = $ProvinceShape
		shape.set_color(baseColor)
	pass # Replace with function body.

func _mouse_left_UI() -> void:
	if mouseInTile:
		shape.set_color(Color(0, 1, 0, 0.2))
	mouseInUI = false
	pass

func _mouse_in_UI() -> void:
	shape.set_color(baseColor)
	mouseInUI = true
	pass

func _mouse_enter() -> void:
	shape.set_color(Color(0, 1, 0, 0.2))
	mouseInTile = true

func _mouse_exit() -> void:
	shape.set_color(baseColor)
	mouseInTile = false
	
func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton and mouseInTile and !mouseInUI and !mouseOnSprite and event.is_action_pressed("left_click"):
		emit_signal("tileClicked", regionName)
		#open tile info screen

