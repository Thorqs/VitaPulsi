
extends VBoxContainer

@export var userData = UserData.new()

var Food : int
var Water : int
var Sleep : int 
var Stress : int
var Activity : int

func _ready():
	userData.load_data()

func _on_input_button_pressed():
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
