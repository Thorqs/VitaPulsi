extends VBoxContainer

var mainMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	mainMenu = get_node("../Main Menu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_main_menu_button_pressed():
	mainMenu.visible = true
	self.visible = false
