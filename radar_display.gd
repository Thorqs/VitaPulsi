extends Panel

var rings: Array
var food_quad: Polygon2D
var water_quad: Polygon2D
var sleep_quad: Polygon2D
var stress_quad: Polygon2D
var activity_quad: Polygon2D
const radar_offset = Vector2(270, 225)
const radar_scaling = 20

# corners of identity pentagons
const pos0 = Vector2(0, -1)
const pos1 = Vector2(sin(0.4*PI), -cos(0.4*PI))
const pos2 = Vector2(sin(0.8*PI), -cos(0.8*PI))
const pos3 = Vector2(sin(1.2*PI), -cos(1.2*PI))
const pos4 = Vector2(sin(1.6*PI), -cos(1.6*PI))

# Called when the node enters the scene tree for the first time.
func _ready():
	# Make an array of offset rings
	rings.append(get_node("1b"))
	rings.append(get_node("2w"))
	rings.append(get_node("3b"))
	rings.append(get_node("4w"))
	rings.append(get_node("5b"))
	rings.append(get_node("6w"))
	rings.append(get_node("7b"))
	rings.append(get_node("8w"))
	rings.append(get_node("9b"))
	rings.append(get_node("10w"))
	
	# make sure they are in the corect position
	for i in range (1, 11):
		rings[i-1].position = radar_offset
		rings[i-1].polygon[0] = radar_scaling*i*pos0
		rings[i-1].polygon[1] = radar_scaling*i*pos1
		rings[i-1].polygon[2] = radar_scaling*i*pos2
		rings[i-1].polygon[3] = radar_scaling*i*pos3
		rings[i-1].polygon[4] = radar_scaling*i*pos4
	
	food_quad = get_node("Food_quad")
	food_quad.position = radar_offset
	food_quad.polygon[2] = Vector2(0, 0)
	
	water_quad = get_node("Water_quad")
	water_quad.position = radar_offset
	water_quad.polygon[2] = Vector2(0, 0)
	
	sleep_quad = get_node("Sleep_quad")
	sleep_quad.position = radar_offset
	sleep_quad.polygon[2] = Vector2(0, 0)
	
	stress_quad = get_node("Stress_quad")
	stress_quad.position = radar_offset
	stress_quad.polygon[2] = Vector2(0, 0)
	
	activity_quad = get_node("Activity_quad")
	activity_quad.position = radar_offset
	activity_quad.polygon[2] = Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var food_peak = pos0*radar_scaling*get_node("../Input/HBox_Food/Food_Val").value
	var water_peak = pos1*radar_scaling*get_node("../Input/HBox_Water/Water_Val").value
	var sleep_peak = pos2*radar_scaling*get_node("../Input/HBox_Sleep/Sleep_Val").value
	var stress_peak = pos3*radar_scaling*get_node("../Input/HBox_Stress/Stress_Val").value
	var activity_peak = pos4*radar_scaling*get_node("../Input/HBox_Activity/Activity_Val").value
	
	food_quad.polygon[0] = food_peak
	food_quad.polygon[1] = (food_peak + water_peak)/2
	food_quad.polygon[3] = (food_peak + activity_peak)/2
	
	water_quad.polygon[0] = water_peak
	water_quad.polygon[1] = (water_peak + sleep_peak)/2
	water_quad.polygon[3] = (water_peak + food_peak)/2
	
	sleep_quad.polygon[0] = sleep_peak
	sleep_quad.polygon[1] = (sleep_peak + stress_peak)/2
	sleep_quad.polygon[3] = (sleep_peak + water_peak)/2
	
	stress_quad.polygon[0] = stress_peak
	stress_quad.polygon[1] = (stress_peak + activity_peak)/2
	stress_quad.polygon[3] = (stress_peak + sleep_peak)/2
	
	activity_quad.polygon[0] = activity_peak
	activity_quad.polygon[1] = (activity_peak + food_peak)/2
	activity_quad.polygon[3] = (activity_peak + stress_peak)/2