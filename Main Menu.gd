extends VBoxContainer

#var logs

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_mm_settings_button_pressed():
	%Settings.visible = true
	self.visible = false


func _on_mm_history_button_pressed():
	%History.visible = true
	self.visible = false


func _on_mm_input_button_pressed():
	%Input.visible = true
	self.visible = false


func _on_mm_output_button_pressed():
	%Output.visible = true
	self.visible = false
