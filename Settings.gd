extends VBoxContainer

var userData: UserData

# Called when the node enters the scene tree for the first time.
func _ready():
	userData = get_node("../IO Panels/Input").userData

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass


func _on_clear_button_pressed():
	get_node("Clear_Button/Clear_Confirm").visible=true

func _on_clear_cancel_button_pressed():
	get_node("Clear_Button/Clear_Confirm").visible=false
	
func _on_confirm_button_pressed():
	userData.clear_food_hist()
	userData.clear_water_hist()
	userData.clear_sleep_hist()
	userData.clear_stress_hist()
	userData.clear_active_hist()
	userData.save_data()
	get_node("Clear_Button/Clear_Confirm").visible=false
