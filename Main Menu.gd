extends VBoxContainer

var settings_menu
var input_menu
var output_menu
var history_menu
var logs

# Called when the node enters the scene tree for the first time.
func _ready():
	settings_menu = get_node("../Settings Menu")
	input_menu = get_node("../Input")
	output_menu = get_node("../Output")
	history_menu = get_node("../History")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_mm_exit_app_button_pressed():
	get_tree().quit()


func _on_mm_settings_button_pressed():
	settings_menu.visible = true
	self.visible = false


func _on_mm_history_button_pressed():
	history_menu.visible = true
	self.visible = false


func _on_mm_input_button_pressed():
	input_menu.visible = true
	self.visible = false


func _on_mm_output_button_pressed():
	output_menu.visible = true
	self.visible = false
