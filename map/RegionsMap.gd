extends Sprite2D

@onready var globals = get_node("/root/Global")

var mapScale : Vector2 = Vector2(2,2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadRegions()
	pass # Replace with function body.

func loadRegions() -> void:
	var image : Image = self.get_texture().get_image()
	var pixelColorDict : Dictionary = {}
	
	for y in range(image.get_height()):
		for x in range(image.get_width()):
			var pixelColor : String ="#" + str(image.get_pixel(int(x), int(y)).to_html(false))
			if pixelColor not in pixelColorDict:
				pixelColorDict[pixelColor] = []
			pixelColorDict[pixelColor].append(Vector2(x,y))
	
	for regionColor in globals.regionsDict:
		var region : Area2D = load("res://map/Regions/region_area.tscn").instantiate()
		region.regionName = globals.regionsDict[regionColor][0]
		region.set_name(region.regionName)
		get_node("/root/World/Regions").add_child(region)
		
		var polygons : Array[PackedVector2Array] = getPolygons(image, pixelColorDict, regionColor)
		
		for polygon in polygons:
			var regionCollision : CollisionPolygon2D = CollisionPolygon2D.new()
			var regionShape : Polygon2D = Polygon2D.new()
			var regionBorder : Line2D = Line2D.new()
			var regionBorder2 : Curve2D = Curve2D.new()
			var polygonCenter : Vector2 = Vector2(0,0)
			
			regionShape.name = "ProvinceShape"
			
			regionBorder = getBorder(regionBorder, regionBorder2, polygon)
			region.add_child(regionBorder)
			
			polygonCenter = getPolygonCenter(polygon)
			globals.regionsDict[regionColor][1][0] = polygonCenter.x
			globals.regionsDict[regionColor][1][1] = polygonCenter.y
			
			var regionArray : Array = [regionCollision, regionShape]
			for item in regionArray:	
				item.polygon = polygon
				item.scale = mapScale
				region.add_child(item)
	pass

func getPolygonCenter(polygon: PackedVector2Array):
	var polygonCenter : Vector2 = Vector2(0,0)
	var top : Vector2 = polygon[0]
	var bottom: Vector2 = polygon[0]
	var right : Vector2 = polygon[0]
	var left : Vector2 = polygon[0]
	
	for vector in polygon:
		if vector.x > right.x:
			right = vector
		if vector.x < left.x:
			left = vector	
		if vector.y > top.y:
			top = vector
		if vector.y < bottom.y:
			bottom = vector
			
	var topR : Vector2 = Vector2(right.x, top.y)		
	var topL : Vector2 = Vector2(left.x, top.y)
	var bottomR : Vector2 = Vector2(right.x, bottom.y)		
	var bottomL : Vector2 = Vector2(left.x, bottom.y)
	
	polygonCenter = (topR + topL + bottomR + bottomL)/4*mapScale
	
	return polygonCenter

func getBorder(regionBorder : Line2D, regionBorder2 : Curve2D, polygon : PackedVector2Array):
	regionBorder2.bake_interval = 0.1
	regionBorder.default_color = Color(0, 0, 0, 0.9)
	regionBorder.width = 5
			
	for vector in polygon:
		regionBorder2.add_point(vector)
		regionBorder.points = regionBorder2.get_baked_points()
			
		regionBorder.points = polygon
		regionBorder.scale = mapScale
		
	return regionBorder

func getPolygons(image : Image, pixelColorDict : Dictionary, regionColor : String):
	var targetImage = Image.create(image.get_size().x,image.get_size().y, false, Image.FORMAT_RGBA8)
	for value in pixelColorDict[regionColor]:
		targetImage.set_pixel (value.x,value.y, "#ffffff")
		
	var bitmap : BitMap = BitMap.new()
	bitmap.create_from_image_alpha (targetImage)
	var polygons : Array[PackedVector2Array] = bitmap.opaque_to_polygons(Rect2(Vector2(0,0), bitmap.get_size()), 0.1)
	
	return polygons

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
