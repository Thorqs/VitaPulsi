extends VBoxContainer

var settings_menu
var input_menu
var output_menu
var history_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	settings_menu = get_node("../Settings Menu")
	input_menu = get_node("../IO Panels/Input")
	output_menu = get_node("../IO Panels/Output")
	history_menu = get_node("../History")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
