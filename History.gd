extends VBoxContainer

var mainMenu
var hist_grid: GridContainer
@export var base_history: PackedScene
var userData = UserData.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	mainMenu = get_node("../Main")
	hist_grid = get_node("History Scroll/History Contents")
	
	userData.load_data()
	self.update_contents()

func update_contents():
	print(userData.history_data)
	if userData.history_data.size() > 0:
		for date in userData.history_data:
			var hist_item = base_history.instantiate()
			hist_grid.add_child(hist_item)
			print(hist_item)
			hist_item.set_date(date)
			hist_item.update_data(userData.history_data[date])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_history_return_to_main_pressed():
	mainMenu.visible = true
	self.visible = false
