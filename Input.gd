
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
	Food = get_node("HBox_Food/Food_Val").value
	Water = get_node("HBox_Water/Water_Val").value
	Sleep = get_node("HBox_Sleep/Sleep_Val").value
	Stress = get_node("HBox_Stress/Stress_Val").value
	Activity = get_node("HBox_Activity/Activity_Val").value
	
	userData.save_data([Food, Water, Sleep, Stress, Activity])
	
	get_node("Input Button/Input_Confirm").visible=false
	
	%Output.update_output()
	%History.update_contents()
