extends Control

var rings: Array
var ring_labels: Array
var food_quad: Polygon2D
var water_quad: Polygon2D
var sleep_quad: Polygon2D
var stress_quad: Polygon2D
var activity_quad: Polygon2D

var food_label: Label
var water_label: Label
var sleep_label: Label
var stress_label: Label
var activity_label: Label
var WYDW_label: Label
var WYDOK_label: Label
var WYDP_label: Label

const radar_offset = Vector2(270, 250)
const radar_scaling = 20

# corners of identity pentagons
const pos0 = Vector2(0, -1)
const pos1 = Vector2(sin(0.4*PI), -cos(0.4*PI))
const pos2 = Vector2(sin(0.8*PI), -cos(0.8*PI))
const pos3 = Vector2(sin(1.2*PI), -cos(1.2*PI))
const pos4 = Vector2(sin(1.6*PI), -cos(1.6*PI))

var data: UserData

# Called when the node enters the scene tree for the first time.
func _ready():
	data = get_node("../History").userData
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
	
	WYDW_label = get_node("VBoxContainer/Answer_WYDW/WYDW_A_Label")
	WYDOK_label = get_node("VBoxContainer/Answer_WYDOK/WYDOK_A_Label")
	WYDP_label = get_node("VBoxContainer/Answer_WYDP/WYDP_A_Label")
	
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
	
	food_label = get_node("Food_label")
	water_label = get_node("Water_label")
	sleep_label = get_node("Sleep_label")
	stress_label = get_node("Stress_label")
	activity_label = get_node("Activity_label")
	
	food_label.position = radar_offset + 11*radar_scaling*pos0 - Vector2(food_label.size.x/2, food_label.size.y/4)
	water_label.position = radar_offset + 11*radar_scaling*pos1 - Vector2(water_label.size.x/4, water_label.size.y/2)
	sleep_label.position = radar_offset + 11*radar_scaling*pos2 - sleep_label.size/2
	stress_label.position = radar_offset + 11*radar_scaling*pos3 - stress_label.size/2
	activity_label.position = radar_offset + 11*radar_scaling*pos4 - Vector2(3*activity_label.size.x/4, activity_label.size.y/2)
	
	update_output()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
func update_output():
	var means = data.calc_means()
	var LoC = ["Food", "Water", "Sleep", "Stress", "Activity"]
	var DW_Array = []
	var DOK_Array = []
	var DP_Array = []
	
	for i in range(0, 5):
		if means[i] >= 7:
			DW_Array.append(LoC[i])
		elif means[i] >3:
			DOK_Array.append(LoC[i])
		else: 
			DP_Array.append(LoC[i])
			
	WYDW_label.text = ""
	var DW_Append = ""
	
	if DW_Array.size() > 1:
		DW_Append = "and " + DW_Array[DW_Array.size() - 1]
	if DW_Array.size() in [1,2]:
		WYDW_label.text = DW_Array[0] + " "
	elif DW_Array.size() > 2:
		for i in range(0, DW_Array.size() - 1):
			WYDW_label.text += DW_Array[i] + ", "
	
	WYDOK_label.text = ""
	var DOK_Append = ""
	
	if DOK_Array.size() > 1:
		DOK_Append = "and " + DOK_Array[DOK_Array.size() - 1]
	if DOK_Array.size() in [1,2]:
		WYDOK_label.text = DOK_Array[0] + " "
	elif DOK_Array.size() > 2:
		for i in range(0, DOK_Array.size() - 1):
			WYDOK_label.text += DOK_Array[i] + ", "
			
	WYDP_label.text = ""
	var DP_Append = ""
	
	if DP_Array.size() > 1:
		DP_Append = "and " + DP_Array[DP_Array.size() - 1]
	if DP_Array.size() in [1,2]:
		WYDP_label.text = DP_Array[0] + " "
	elif DP_Array.size() > 2:
		for i in range(0, DP_Array.size() - 1):
			WYDP_label.text += DP_Array[i] + ", "
	
	WYDW_label.text += DW_Append
	WYDOK_label.text += DOK_Append
	WYDP_label.text += DP_Append 
	
	var food_peak = pos0*radar_scaling*means[0]
	var water_peak = pos1*radar_scaling*means[1]
	var sleep_peak = pos2*radar_scaling*means[2]
	var stress_peak = pos3*radar_scaling*means[3]
	var activity_peak = pos4*radar_scaling*means[4]
	
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
	
	
		
