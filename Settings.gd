extends VBoxContainer

var userData
var mainMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	# IMPORTANT: references History userData varable to avoid data race
	userData = get_node("%History").userData
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass


func _on_clear_button_pressed():
	get_node("Clear_Button/Clear_Confirm").visible=true

func _on_clear_cancel_button_pressed():
	get_node("Clear_Button/Clear_Confirm").visible=false
	
func _on_confirm_button_pressed():
	userData.clear_history()
	get_node("%History").update_contents()
	get_node("%Output").update_output()
	#userData.save_data() # not sure why this is here
	get_node("Clear_Button/Clear_Confirm").visible=false

func _on_return_to_main_button_pressed():
	get_node("%Main").visible = true
	self.visible = false

