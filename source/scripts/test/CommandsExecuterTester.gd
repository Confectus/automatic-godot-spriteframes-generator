extends Node

# ===  script docstring  ===
# script that contains a full stack of functions that test the functionalities
# implemented in the CommandsExecuter script


const CHILD_NAME = "CommandsExecuter"
const CHILD_SCRIPT_PATH = "res://scripts/source/CommandsExecuter.gd"

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
	print(">>> CommandsExecuter Test\n")
	
	for i in range(tester_functions.size()):
		call(tester_functions[i], i + 1)

# ===  test function  ===
# i -> int : it is the index of the test
func t01_given_path_when_checking_engine_path_then_ok(i):
	var engine_path = OS.get_system_dir(2) + "/Apps/Blender/blender.exe"
	var current = $CommandsExecuter.check_engine_path(engine_path)
	
	var result = "(" + str(i) + ") "
	result += "Checking engine path:"
	result += "\n"
	result += testers_handler.assert_equals(current, true)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t02_given_wrong_path_when_checking_engine_path_then_fail(i):
	var engine_path = OS.get_system_dir(2) + "/blender.exe"
	var current = $CommandsExecuter.check_engine_path(engine_path)
	
	var result = "(" + str(i) + ") "
	result += "Checking engine path:"
	result += "\n"
	result += testers_handler.assert_equals(current, false)
	
	print(result)

# ===  test function  ===
# i -> int : it is the index of the test
func t03_given_blender_file_when_rendering_scene_then_ok(i):
	var engine_path = OS.get_system_dir(2) + "/Apps/Blender/blender.exe"
	var file_path = "C:/Users/Confectus/Desktop/blender_test/model.blend"
	var output_path = "C:/Users/Confectus/Desktop/folder/"
	var scene = "OriginalScene"
	var firstFrame = "1"
	var lastFrame = "20"
	var current = $CommandsExecuter.execute_rendering_command(
		engine_path,
		file_path,
		output_path,
		scene,
		firstFrame,
		lastFrame
	)
	
	var result = "(" + str(i) + ") "
	result += "Rendering Blender file:"
	result += "\n"
	result += testers_handler.assert_equals(typeof(current), typeof(0))
	
	print(result)
