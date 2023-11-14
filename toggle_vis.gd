extends CheckButton

var input: VBoxContainer
var output: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	input = get_node("../../IO/Input")
	input.visible = true
	
	output = get_node("../../IO/Output")
	output.visible = false
	
	#button_pressed = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_toggled(button_pressed):
	input.visible = not button_pressed
	output.visible = button_pressed
