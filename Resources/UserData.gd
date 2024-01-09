extends Resource
class_name UserData

var save_file_path = "user://save/"
var save_file_name = "UserData.tres"

var history_data: Dictionary

func load_data():
	DirAccess.make_dir_absolute(save_file_path)
	if ResourceLoader.exists(save_file_path + save_file_name):
		var temp = ResourceLoader.load(save_file_path + save_file_name)
		history_data = temp.history_data

func save_data(values: Array[int], day = Time.get_date_string_from_system()):
	history_data[day] =  values
	ResourceSaver.save(self, save_file_path + save_file_name)

func clear_history():
	history_data.clear()

func calc_means(days = 90):
	# Generally speaking:
	# - convert current date into unix time
	# - step through dictionary in steps of 1 day of unix time (whatever that is)
	# - Convert that day to string
	# - try to access that day
	# - if successful:
	#	- increment num values
	#	- add to ongoing means
	#- else: nothing
	var means = [0, 0, 0, 0, 0]
	
	if history_data.size() > 0:
		if history_data.size() >= days:
			for index in range(0,5):
				for day in range(0, days):
						means[index] += history_data[days][index]
				means[index] = means[index]/days
		else:
			for index in range(0,5):
				for entry in history_data:
					means[index] += history_data[entry][index]
				means[index] = means[index]/len(history_data)
	return means

