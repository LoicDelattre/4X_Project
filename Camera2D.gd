extends Camera2D

var zoomFactor:Vector2 = Vector2(.2, .2)
var zoomMin:Vector2 = Vector2(0.9, 0.9)
var zoomMax:Vector2 = Vector2(2, 2)
var desiredZoom:Vector2 = zoom

var moveSpeed:int = 25

var screenResolution:Vector2 = Vector2(0, 0)
var minPosition:Vector2 = Vector2(0, 0)  
var maxPosition:Vector2 = Vector2(0, 0) 

var floatPointError:Vector2 = Vector2(0.000000001, 0.000000001)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:   
	screenResolution = get_viewport_rect().size
	minPosition = get_viewport_rect().size/2  
	maxPosition = Vector2(5400/2, 4800/2) - minPosition	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	pass # Replace with function body.

func boundPosition(newPosition:Vector2) -> Vector2:
	if newPosition.x < minPosition.x or newPosition.y < minPosition.y:
		if newPosition.x < minPosition.x:
			newPosition.x = minPosition.x
		elif newPosition.y < minPosition.y:
			newPosition.y = minPosition.y
		elif newPosition.y < minPosition.y and newPosition.x < minPosition.x:
			newPosition = minPosition
	elif newPosition.x > maxPosition.x or newPosition.y > maxPosition.y:
		if newPosition.x > maxPosition.x:
			newPosition.x = maxPosition.x
		elif newPosition.y > maxPosition.y:
			newPosition.y = maxPosition.y
		elif newPosition.x > maxPosition.x and newPosition.y > maxPosition.y:
			newPosition = maxPosition
		
	return newPosition

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	
	zoom = lerp(zoom, desiredZoom, 0.2)
	
	var inputX:int = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var inputY:int = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	var newPosX:int = lerp(position.x, position.x + inputX*moveSpeed, moveSpeed*delta*(1/desiredZoom.x))
	var newPosY:int = lerp(position.y, position.y + inputY*moveSpeed, moveSpeed*delta*(1/desiredZoom.y))
	var newPos:Vector2 = Vector2(newPosX, newPosY)
		
	#maitain position vector inside the camera limits
	position = boundPosition(newPos)
	pass

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.is_action("zoom_in"):
				if desiredZoom > zoomMin:
					desiredZoom -= zoomFactor
			elif event.is_action("zoom_out"):
				if desiredZoom < zoomMax:
					desiredZoom += zoomFactor
	
	pass
