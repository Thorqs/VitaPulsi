extends Panel

var rings: Array
var ring_labels: Array
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

var data = UserData

# Called when the node enters the scene tree for the first time.
func _ready():
	data = get_node("../Input").userData
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
	
	ring_labels.append(get_node("2"))
	ring_labels.append(get_node("4"))
	ring_labels.append(get_node("6"))
	ring_labels.append(get_node("8"))
	ring_labels.append(get_node("10"))
	
	# make sure they are in the corect position
	for i in range (1, 11):
		rings[i-1].position = radar_offset
		rings[i-1].polygon[0] = radar_scaling*i*pos0
		rings[i-1].polygon[1] = radar_scaling*i*pos1
		rings[i-1].polygon[2] = radar_scaling*i*pos2
		rings[i-1].polygon[3] = radar_scaling*i*pos3
		rings[i-1].polygon[4] = radar_scaling*i*pos4
	
	for i in range (1, 6):
		ring_labels[i-1].position = radar_offset + radar_scaling*(2*i-0.5)*(pos2+pos3)/2 - ring_labels[i-1].size/2
	
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
	var food_mean = 0
	var water_mean = 0
	var sleep_mean = 0
	var stress_mean = 0
	var active_mean = 0
	if len(data.food_hist) > 0:
		for entry in data.food_hist:
			food_mean += entry
		food_mean = food_mean/len(data.food_hist)
		
		for entry in data.water_hist:
			water_mean += entry
		water_mean = water_mean/len(data.water_hist)
		
		for entry in data.sleep_hist:
			sleep_mean += entry
		sleep_mean = sleep_mean/len(data.sleep_hist)
		
		for entry in data.stress_hist:
			stress_mean += entry
		stress_mean = stress_mean/len(data.stress_hist)
		
		for entry in data.active_hist:
			active_mean += entry
		active_mean = active_mean/len(data.active_hist)
	
	var food_peak = pos0*radar_scaling*food_mean
	var water_peak = pos1*radar_scaling*water_mean
	var sleep_peak = pos2*radar_scaling*sleep_mean
	var stress_peak = pos3*radar_scaling*stress_mean
	var activity_peak = pos4*radar_scaling*active_mean
	
	food_quad.polygon[0] = food_peak
	food_quad.polygon[1] = (food_peak + water_peak)/4
	food_quad.polygon[3] = (food_peak + activity_peak)/4
	
	water_quad.polygon[0] = water_peak
	water_quad.polygon[1] = (water_peak + sleep_peak)/4
	water_quad.polygon[3] = (water_peak + food_peak)/4
	
	sleep_quad.polygon[0] = sleep_peak
	sleep_quad.polygon[1] = (sleep_peak + stress_peak)/4
	sleep_quad.polygon[3] = (sleep_peak + water_peak)/4
	
	stress_quad.polygon[0] = stress_peak
	stress_quad.polygon[1] = (stress_peak + activity_peak)/4
	stress_quad.polygon[3] = (stress_peak + sleep_peak)/4
	
	activity_quad.polygon[0] = activity_peak
	activity_quad.polygon[1] = (activity_peak + food_peak)/4
	activity_quad.polygon[3] = (activity_peak + stress_peak)/4
