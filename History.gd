extends VBoxContainer

var mainMenu
var history_contents = []
var hist_grid: GridContainer
@export var base_history: PackedScene
var userData = UserData.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	mainMenu = get_node("../Main Menu")
	hist_grid = get_node("History Scroll/History Contents")
	userData.load_data()
	
	var test_item = base_history.instantiate()
	hist_grid.add_child(test_item)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_main_menu_button_pressed():
	mainMenu.visible = true
	self.visible = false
