extends Sprite2D

var regionsDict : Dictionary = {
	"#c4a000" : "United Kingdom",
	"#d45500" : "France",
	"#00007f" : "Ireland",
	"#e2fe1d" : "Belgium",
	"#75507b" : "Portugal",
	"#e0f324" : "Spain"
}

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
	
	for regionColor in regionsDict:
		var region : Area2D = load("res://map/Regions/region_area.tscn").instantiate()
		region.regionName = regionsDict[regionColor]
		region.set_name(region.regionName)
		get_node("/root/World/Regions").add_child(region)
		
		var polygons : Array[PackedVector2Array] = getPolygons(image, pixelColorDict, regionColor)
		
		for polygon in polygons:
			var regionCollision : CollisionPolygon2D = CollisionPolygon2D.new()
			regionCollision.name = "ProvinceCollision"
			var regionShape : Polygon2D = Polygon2D.new()
			regionShape.name = "ProvinceShape"
			
			regionCollision.polygon = polygon
			regionShape.polygon = polygon
			
			region.add_child(regionCollision)
			region.add_child(regionShape)
	pass

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
