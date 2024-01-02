extends CheckButton

var input: VBoxContainer
var output: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	input = get_node("../../IO Panels/Input")
	input.visible = true
	
	output = get_node("../../IO Panels/Output")
	output.visible = false
	
	button_pressed = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_toggled(button_pressing):
	input.visible = not button_pressing
	output.visible = button_pressing
