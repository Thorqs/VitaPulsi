extends Node

var save_file_path = "user://save/"
var save_file_name = "UserData.tres"

var userData = UserData.new()

func _ready():
	verify_save_dir(save_file_path)

func verify_save_dir(path : String):
	DirAccess.make_dir_absolute(path)

func _on_input_button_pressed():
	
	ResourceSaver.save(UserData, save_file_path + save_file_name)

