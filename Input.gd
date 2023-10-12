extends Node

var save_path = "user://user_data.save"

var Food_Hist = []
var Water_Hist = []
var Sleep_Hist = []
var Stress_Hist = []
var Active_Hist = []

		
func _ready():
	# get the list of values objects?
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_input_button_pressed():
	save()

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Food_Hist)
	file.store_var(Water_Hist)
	file.store_var(Sleep_Hist)
	file.store_var(Stress_Hist)
	file.store_var(Active_Hist)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Food_Hist = file.get_var(Food_Hist)
		Water_Hist = file.get_var(Water_Hist)
		Sleep_Hist = file.get_var(Sleep_Hist)
		Stress_Hist = file.get_var(Stress_Hist)
		Active_Hist = file.get_var(Active_Hist)
	else:
		print("No data saved...")
		var Food_Hist = []
		var Water_Hist = []
		var Sleep_Hist = []
		var Stress_Hist = []
		var Active_Hist = []
