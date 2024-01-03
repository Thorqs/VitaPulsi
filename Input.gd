
extends VBoxContainer

@export var userData = UserData.new()

var Food : int
var Water : int
var Sleep : int 
var Stress : int
var Activity : int

func _ready():
	userData.load_data()

func _on_input_confirm_button_pressed():
	get_node("Input_Button/Input_Confirm").visible=true
	
func _on_input_cancel_button_pressed():
	get_node("Input_Button/Input_Confirm").visible=false

func _on_confirm_input_button_pressed():
	Food = get_node("HBox_Food/Food_Val").value
	Water = get_node("HBox_Water/Water_Val").value
	Sleep = get_node("HBox_Sleep/Sleep_Val").value
	Stress = get_node("HBox_Stress/Stress_Val").value
	Activity = get_node("HBox_Activity/Activity_Val").value
	userData.update_food(Food)
	userData.update_water(Water)
	userData.update_sleep(Sleep)
	userData.update_stress(Stress)
	userData.update_activity(Activity)
	userData.save_data()
	get_node("Input_Button/Input_Confirm").visible=false
	

func _on_visibility_changed():
	
	#print()
	if userData.day_hist.size() > 0 and userData.day_hist[userData.day_hist.size() - 1] == Time.get_date_string_from_system():
		get_node("Input_Button").disabled = true
		get_node("Input_Button").text = "One input per day"
	else:
		get_node("Input_Button").disabled = false
		get_node("Input_Button").text = "Enter data"

