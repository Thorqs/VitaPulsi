extends Resource
class_name UserData

var save_file_path = "user://save/"
var save_file_name = "UserData.csv"

var history_data: Dictionary

func load_data():
	DirAccess.make_dir_absolute(save_file_path)
	#if ResourceLoader.exists(save_file_path + save_file_name):
	#	var temp = ResourceLoader.load(save_file_path + save_file_name)
	if FileAccess.file_exists(save_file_path + save_file_name):
		var load_file = FileAccess.open(save_file_path + save_file_name, FileAccess.READ)
		var line = ""
		var contents = []
		var day_data: Array[int]
		while load_file.get_position() < load_file.get_length():
			line = load_file.get_line()
			contents = line.split(", ")
			#for item in contents:
			#	item = item.strip()
			#print("contents: ", contents)
			# find a better way to do line below
			day_data = [int(contents[1]), int(contents[2]), int(contents[3]), int(contents[4]), int(contents[5])]
			history_data[contents[0]] = day_data
			
		#print("Loaded ", history_data)

func save_data(values: Array[int], day = Time.get_date_string_from_system()):
	history_data[day] = values
	#print("saving ", values, day)
	#ResourceSaver.save(self, save_file_path + save_file_name)
	var save_file = FileAccess.open(save_file_path + save_file_name, FileAccess.WRITE)
	for date in history_data:
		save_file.store_line(date + ", " + str(history_data[date]).lstrip("[").rstrip("]"))

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

