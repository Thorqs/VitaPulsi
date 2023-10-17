extends Resource
class_name UserData

@export var food_hist = []
@export var water_hist = []
@export var sleep_hist = []
@export var stress_hist = []
@export var active_hist = []

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
