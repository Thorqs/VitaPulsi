extends Panel

var date_label: Label
var food_val: Label
var water_val: Label
var sleep_val: Label
var stress_val: Label
var activity_val: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	date_label = get_node("Hist_VBox/Date_Label")
	food_val = get_node("Hist_VBox/GridContainer/Food")
	water_val = get_node("Hist_VBox/GridContainer/Water")
	sleep_val = get_node("Hist_VBox/GridContainer/Sleep")
	stress_val = get_node("Hist_VBox/GridContainer/Stress")
	activity_val = get_node("Hist_VBox/GridContainer/Activity")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_val(val_name: Label, new_value: int):
	val_name.text = val_name.text.get_slice(":", 0) + ":" + str(new_value)
	if new_value > 7:
		val_name.add_theme_color_override("theme_override_colors/font_color", Color("Green"))
	elif new_value > 3:
		val_name.add_theme_color_override("theme_override_colors/font_color", Color("Yellow"))
	else:
		val_name.add_theme_color_override("theme_override_colors/font_color", Color("Red"))

func update_data(new_values: Array[int]):
	set_val(food_val, new_values[0])
	set_val(water_val, new_values[1])
	set_val(sleep_val, new_values[2])
	set_val(stress_val, new_values[3])
	set_val(activity_val, new_values[4])
	
	var mean_value = (new_values[0] + new_values[1] + new_values[2] + new_values[3] + new_values[4])/5.0
	if mean_value > 7:
		date_label.add_theme_color_override("theme_override_colors/font_color", Color("Green"))
	elif mean_value > 3:
		date_label.add_theme_color_override("theme_override_colors/font_color", Color("Yellow"))
	else:
		date_label.add_theme_color_override("theme_override_colors/font_color", Color("Red"))
