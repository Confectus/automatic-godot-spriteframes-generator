extends Node

# ===  script docstring  ===
# script that contains a full stack of functions that test the functionalities
# implemented in the DirectoriesHandler script


const CHILD_NAME = "PathsHandler"
const CHILD_SCRIPT_PATH = "res://scripts/source/PathsHandler.gd"

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
	print(">>> PathsHandler Test\n")
	
	for i in range(tester_functions.size()):
		call(tester_functions[i], i + 1)

# ===  test function  ===
# i -> int : it is the index of the test
func t01_given_path_request_when_getting_default_path_then_ok(i):
	var current = $PathsHandler.get_default_working_path()
	var expected = OS.get_system_dir(2)
	
	var result = "(" + str(i) + ") "
	result += "Getting Default Working Path:"
	result += "\n"
	result += testers_handler.assert_equals(current, expected)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t02_given_existing_file_path_when_checking_existence_then_ok(i):
	var current = $PathsHandler.check_path_existence("C:/Windows/win.ini")
	
	var result = "(" + str(i) + ") "
	result += "Checking File Path Existence:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t03_given_not_existing_file_path_when_checking_existence_then_fail(i):
	var not_existing_file_path = "C:/UnknowFolder/UnknowFile.txt" 
	var current = $PathsHandler.check_path_existence(not_existing_file_path)
	
	var result = "(" + str(i) + ") "
	result += "Checking File Path Existence:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t04_given_existing_folder_path_when_checking_existence_then_ok(i):
	var current = $PathsHandler.check_path_existence(OS.get_system_dir(2))
	
	var result = "(" + str(i) + ") "
	result += "Checking Folder Path Existence:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t05_given_not_existing_folder_path_when_checking_existence_then_fail(i):
	var not_existing_folder_path = OS.get_system_dir(2) + "/UnknowFolder"
	var current = $PathsHandler.check_path_existence(not_existing_folder_path)
	
	var result = "(" + str(i) + ") "
	result += "Checking Folder Path Existence:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t06_given_existing_folder_path_when_creating_folder_then_ok(i):
	var existing_folder_path = OS.get_system_dir(2)
	var folder_name = "New-Folder"
	var current = $PathsHandler.create_folder(existing_folder_path, folder_name)
	
	var result = "(" + str(i) + ") "
	result += "Creating Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t07_given_existing_folder_path_when_creating_existing_folder_then_fail(i):
	var existing_folder_path = OS.get_system_dir(2)
	var folder_name = "New-Folder"
	var current = $PathsHandler.create_folder(existing_folder_path, folder_name)
	
	var result = "(" + str(i) + ") "
	result += "Creating Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t08_given_empty_folder_path_when_checking_empty_folder_then_ok(i):
	var existing_folder_path = OS.get_system_dir(2) + "/Zoom"
	var current = $PathsHandler.check_folder_is_empty(existing_folder_path)
	
	var result = "(" + str(i) + ") "
	result += "Checking Empty Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t09_given_not_empty_folder_path_when_checking_empty_folder_then_fail(i):
	var existing_folder_path = OS.get_system_dir(2)
	var current = $PathsHandler.check_folder_is_empty(existing_folder_path)
	
	var result = "(" + str(i) + ") "
	result += "Checking Empty Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t10_given_resource_when_saving_resource_then_ok(i):
	var path = OS.get_system_dir(2) + "/New-Folder"
	var resource_name = "test-resource.tres"
	var resource = SpriteFrames.new()
	var current = $PathsHandler.save_resource(path, resource_name, resource)
	
	var result = "(" + str(i) + ") "
	result += "Saving Resource:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t11_given_existing_resource_when_saving_same_resource_then_fail(i):
	var path = OS.get_system_dir(2) + "/New-Folder"
	var resource_name = "test-resource.tres"
	var resource = SpriteFrames.new()
	var current = $PathsHandler.save_resource(path, resource_name, resource)
	
	var result = "(" + str(i) + ") "
	result += "Saving Resource:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t12_given_existing_resource_when_moving_resource_then_ok(i):
	var source = OS.get_system_dir(2) + "/New-Folder"
	var destination = OS.get_system_dir(2)
	var res_name = "test-resource.tres"
	var current = $PathsHandler.move_resource(source, destination, res_name)
	
	var result = "(" + str(i) + ") "
	result += "Moving Resource:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t13_given_not_existing_resource_when_moving_resource_then_fail(i):
	var source = OS.get_system_dir(2) + "/New-Folder"
	var destination = OS.get_system_dir(2)
	var res_name = "test-resource.tres"
	var current = $PathsHandler.move_resource(source, destination, res_name)
	
	var result = "(" + str(i) + ") "
	result += "Moving Resource:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t14_given_existing_folder_when_moving_folder_then_ok(i):
	var source = OS.get_system_dir(2)
	var destination = OS.get_system_dir(2) + "/Zoom"
	var res_name = "New-Folder"
	var current = $PathsHandler.move_resource(source, destination, res_name)
	
	var result = "(" + str(i) + ") "
	result += "Moving Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t15_given_not_existing_folder_when_moving_folder_then_fail(i):
	var source = OS.get_system_dir(2)
	var destination = OS.get_system_dir(2) + "/Zoom"
	var res_name = "New-Folder"
	var current = $PathsHandler.move_resource(source, destination, res_name)
	
	var result = "(" + str(i) + ") "
	result += "Moving Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t16_given_existing_resource_when_deleting_resource_then_ok(i):
	var resource_path = OS.get_system_dir(2)
	var resource_name = "test-resource.tres"
	var current = $PathsHandler.delete_resource(resource_path, resource_name)
	
	var result = "(" + str(i) + ") "
	result += "Deleting Resource:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t17_given_not_existing_resource_when_deleting_resource_then_fail(i):
	var resource_path = OS.get_system_dir(2)
	var resource_name = "test-resource.tres"
	var current = $PathsHandler.delete_resource(resource_path, resource_name)
	
	var result = "(" + str(i) + ") "
	result += "Deleting Resource:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t18_given_existing_folder_when_deleting_folder_then_ok(i):
	var folder_path = OS.get_system_dir(2) + "/Zoom"
	var folder_name = "New-Folder"
	var current = $PathsHandler.delete_resource(folder_path, folder_name)
	
	var result = "(" + str(i) + ") "
	result += "Deleting Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t19_given_not_existing_folder_when_deleting_folder_then_fail(i):
	var folder_path = OS.get_system_dir(2) + "/Zoom"
	var folder_name = "New-Folder"
	var current = $PathsHandler.delete_resource(folder_path, folder_name)
	
	var result = "(" + str(i) + ") "
	result += "Deleting Folder:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t20_given_full_resource_path_when_splitting_path_then_ok(i):
	var full_path = "C:/Users/Confectus/Documents/Apps/Blender/blender.exe"
	var expected_root_path = "C:/Users/Confectus/Documents/Apps/Blender"
	var expected_resource_name = "blender.exe"
	var split_values = $PathsHandler.split_path(full_path)
	
	var result = "(" + str(i) + ") "
	result += "Splitting Path:"
	result += "\n"
	result += testers_handler.assert_equals(
		split_values["root_path"], 
		expected_root_path
		)
	result += testers_handler.assert_equals(
		split_values["resource_name"], 
		expected_resource_name
		)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t21_given_full_folder_path_when_splitting_path_then_ok(i):
	var full_path = OS.get_system_dir(2) + "/Zoom"
	var expected_root_path = OS.get_system_dir(2)
	var expected_resource_name = "Zoom"
	var split_values = $PathsHandler.split_path(full_path)
	
	var result = "(" + str(i) + ") "
	result += "Splitting Path:"
	result += "\n"
	result += testers_handler.assert_equals(
		split_values["root_path"], 
		expected_root_path
		)
	result += testers_handler.assert_equals(
		split_values["resource_name"], 
		expected_resource_name
		)
	
	print(result)
