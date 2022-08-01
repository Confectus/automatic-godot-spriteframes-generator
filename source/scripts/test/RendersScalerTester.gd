extends Node

# ===  script docstring  ===
# script that contains a full stack of functions that test the functionalities
# implemented in the RendersScaler script


const CHILD_NAME = "RendersScaler"
const CHILD_SCRIPT_PATH = "res://scripts/source/RendersScaler.gd"

onready var testers_handler = get_parent()

var tester_functions = []

# ===  initial process  ===
# creating a child node to associate the script with the functionalities
func _init():
	var child = Node.new()
	
	child.name = CHILD_NAME
	child.script = load(CHILD_SCRIPT_PATH)
	
	add_child(child)
	
	child.owner = self

# === entering tree function  ===
func _ready():
	# getting the implemented test functions of the tester
	tester_functions = get_functions_names()

# ===  public function  ===
func get_functions_names():
	var functions = []
	
	# filtering the names of the functions
	for function in get_method_list():
		if function["flags"] == METHOD_FLAG_NORMAL + METHOD_FLAG_FROM_SCRIPT:
			if not testers_handler.EXCLUDE_FUNCTIONS.has(function["name"]):
				functions.append(function["name"])
	
	functions.sort()
	
	return functions

# ===  public function  ===
# function that runs all the test of the tester
func run_complete_test():
	print(">>> RendersScaler Test\n")
	
	for i in range(tester_functions.size()):
		call(tester_functions[i], i + 1)

# ===  test function  ===
# i -> int : it is the index of the test
func t01_given_a_render_when_getting_height_then_ok(i):
	var temp_paths_handler = load("res://scripts/source/PathsHandler.gd").new()
	var image_path = "C:/Users/Confectus/Desktop/godot_test"
	var texture = temp_paths_handler.get_image(image_path, "ds.png")
	
	var current = $RendersScaler.get_render_height(texture)
	var expected = 1080
	
	var result = "(" + str(i) + ") "
	result += "Getting Render Height:"
	result += "\n"
	result += testers_handler.assert_equals(current, expected)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t02_given_a_render_when_getting_width_then_ok(i):
	var temp_paths_handler = load("res://scripts/source/PathsHandler.gd").new()
	var image_path = "C:/Users/Confectus/Desktop/godot_test"
	var texture = temp_paths_handler.get_image(image_path, "ds.png")
	
	var current = $RendersScaler.get_render_width(texture)
	var expected = 1920
	
	var result = "(" + str(i) + ") "
	result += "Getting Render Width:"
	result += "\n"
	result += testers_handler.assert_equals(current, expected)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t03_given_a_render_when_checking_if_scaling_is_possible_then_ok(i):
	var temp_paths_handler = load("res://scripts/source/PathsHandler.gd").new()
	var image_path = "C:/Users/Confectus/Desktop/godot_test"
	var texture = temp_paths_handler.get_image(image_path, "ds.png")
	
	var current = $RendersScaler.scaling_is_possible(texture, 960, 540)
	
	var result = "(" + str(i) + ") "
	result += "Checking Scaling Possibility:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t04_given_a_render_when_checking_if_scaling_is_possible_then_fail(i):
	var temp_paths_handler = load("res://scripts/source/PathsHandler.gd").new()
	var image_path = "C:/Users/Confectus/Desktop/godot_test"
	var texture = temp_paths_handler.get_image(image_path, "ds.png")
	
	var current = $RendersScaler.scaling_is_possible(texture, 16385, 16384)
	
	var result = "(" + str(i) + ") "
	result += "Checking Scaling Possibility:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t05_given_a_render_when_scaling_then_ok(i):
	var temp_paths_handler = load("res://scripts/source/PathsHandler.gd").new()
	var image_path = "C:/Users/Confectus/Desktop/godot_test"
	var texture = temp_paths_handler.get_image(image_path, "ds.png")
	
	var new_texture = $RendersScaler.scale_render(texture, 960, 540)
	var current_w = $RendersScaler.get_render_width(new_texture)
	var current_h = $RendersScaler.get_render_height(new_texture)
	
	var result = "(" + str(i) + ") "
	result += "Scaling Render:"
	result += "\n"
	result += testers_handler.assert_equals(current_w, 960)
	result += testers_handler.assert_equals(current_h, 540)
	
	print(result)
