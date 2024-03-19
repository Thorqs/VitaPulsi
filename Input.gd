
extends VBoxContainer

var userData: UserData

var Food : int
var Water : int
var Sleep : int 
var Stress : int
var Activity : int

func _ready():
	userData = get_node("../History").userData

func _on_return_to_main_button():
	self.visible = false
	%Main.visible = true

func _on_input_confirm_button_pressed():
	get_node("Input Button/Input_Confirm").visible=true
	
func _on_input_cancel_button_pressed():
	get_node("Input Button/Input_Confirm").visible=false

func _on_confirm_input_button_pressed():
	Food = get_node("Food_Slider").value
	Water = get_node("Water_Slider").value
	Sleep = get_node("Sleep_Slider").value
	Stress = get_node("Stress_Slider").value
	Activity = get_node("Activity_Slider").value
	
	userData.save_data([Food, Water, Sleep, Stress, Activity])
	
	get_node("Input Button/Input_Confirm").visible=false
	
	%Output.update_output()
	%History.update_contents()

func _on_visibility_changed():
	get_node("Food_Slider").value = 5
	get_node("Water_Slider").value = 5
	get_node("Sleep_Slider").value = 5
	get_node("Stress_Slider").value = 5 
	get_node("Activity_Slider").value = 5

func _on_food_slider_value_changed(value):
	get_node("HBox_Food/Food_Value").text = str(value)

func _on_water_slider_value_changed(value):
	get_node("HBox_Water/Water_Value").text = str(value)

func _on_sleep_slider_value_changed(value):
	get_node("HBox_Sleep/Sleep_Value").text = str(value)

func _on_stress_slider_value_changed(value):
	get_node("HBox_Stress/Stress_Value").text = str(value)

func _on_activity_slider_value_changed(value):
	get_node("HBox_Activity/Activity_Value").text = str(value)
