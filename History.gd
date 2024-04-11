extends VBoxContainer

var hist_grid: GridContainer
@export var base_history: PackedScene
var userData = UserData.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	hist_grid = get_node("History Scroll/History Contents")
	
	userData.load_data()
	self.update_contents()

func update_contents():
	# Clear children
	for child in get_node("History Scroll/History Contents").get_children():
		child.queue_free()
	# Add new children
	if userData.history_data.size() > 0:
		
		for date in userData.history_data:
			var hist_item = base_history.instantiate()
			hist_grid.add_child(hist_item)
			hist_item.set_date(date)
			hist_item.update_data(userData.history_data[date])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_history_return_to_main_pressed():
	%Main.visible = true
	self.visible = false




func _on_history_contents_resized():
	hist_grid.columns = int(floor((get_viewport_rect().size.x-40) / 160))
