extends Resource
class_name UserData

var save_file_path = "user://save/"
var save_file_name = "UserData.tres"

@export var history_data = []
@export var day_hist = []

func load_data():
	DirAccess.make_dir_absolute(save_file_path)
	if ResourceLoader.exists(save_file_path + save_file_name):
		var temp = ResourceLoader.load(save_file_path + save_file_name)
		history_data = temp.history_data
		day_hist = temp.day_hist

func save_data(values: Array[int]):
	day_hist.append(Time.get_date_string_from_system())
	history_data.append(values)
	ResourceSaver.save(self, save_file_path + save_file_name)

func clear_history():
	history_data.clear()
	day_hist.clear()

func calc_means(days = 90):
	var means = [0, 0, 0, 0, 0]
	
	if len(history_data) > 0:
		if len(history_data) >= days:
			for index in range(0,5):
				for day in range(0, days):
						means[index] += history_data[days][index]
				means[index] = means[index]/days
		else:
			for index in range(0,5):
				for entry in history_data:
					means[index] += entry[index]
				means[index] = means[index]/len(history_data)
	return means

