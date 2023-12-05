extends Resource
class_name UserData

var save_file_path = "user://save/"
var save_file_name = "UserData.tres"

@export var food_hist = []
@export var water_hist = []
@export var sleep_hist = []
@export var stress_hist = []
@export var active_hist = []
@export var day_hist = []

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
	day_hist.append(Time.get_date_string_from_system())
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

func clear_food_hist():
	food_hist.clear()

func clear_water_hist():
	water_hist.clear()

func clear_sleep_hist():
	sleep_hist.clear()

func clear_stress_hist():
	stress_hist.clear()

func clear_active_hist():
	active_hist.clear()

