extends Resource
class_name UserData

var save_file_path = "user://save/"
var save_file_name = "UserData.tres"

@export var food_hist = []
@export var water_hist = []
@export var sleep_hist = []
@export var stress_hist = []
@export var active_hist = []

func load_data():
	DirAccess.make_dir_absolute(save_file_path)
	if ResourceLoader.exists(save_file_path + save_file_name):
		var temp = ResourceLoader.load(save_file_path + save_file_name)
		food_hist = temp.food_hist
		water_hist = temp.water_hist
		sleep_hist = temp.sleep_hist
		stress_hist = temp.stress_hist
		active_hist = temp.active_hist

func save_data():
	ResourceSaver.save(self, save_file_path + save_file_name)

func update_food(value : int):
	food_hist.append(value)

func update_water(value : int):
	water_hist.append(value)

func update_sleep(value : int):
	sleep_hist.append(value)
	
func update_stress(value : int):
	stress_hist.append(value)
	
func update_activity(value : int):
	active_hist.append(value)
