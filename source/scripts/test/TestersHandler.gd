extends Node

# ===  script docstring  ===
# script that handles all the existing individual testers


# names of the functions that will not be included in the tests of the testers
const EXCLUDE_FUNCTIONS = [
	"_init",
	"_ready",
	"get_functions_names",
	"run_complete_test"
]

# ===  initial process  ===
func _init():
	# creating a child for each individual tester
	create_child(
		"PathsHandlerTester",
		"res://scripts/test/PathsHandlerTester.gd"
		)
	
	create_child(
		"CommandsExecuterTester",
		"res://scripts/test/CommandsExecuterTester.gd"
		)

# ===  global function  ===
# function that compares two values and returns a simplified message about the
# comparison
# current -> Variant : it is the current value used in the comparison
# expected -> Variant : it is the expected value used in the comparison
# endline -> String : it is the endline part of the resulting message
# return -> String : a message about the comparison of the values
func assert_equals(current, expected, endline: String = "\n") -> String:
	if typeof(current) == typeof(expected):
		if current == expected:
			return "\t== OK ==\tCurrent: " + str(current) + ", Expected: " \
				+ str(expected) + endline
		
		else:
			return "\t== FAIL ==\tCurrent: " + str(current) + ", Expected: " \
				+ str(expected) + endline
	
	return "\t== ERROR ==\tIt is not possible to compare values of different " \
		+ "types (Current type: " + str(typeof(current)) + ", Expected type: " \
		+ str(typeof(expected)) + ")" + endline

# ===  public function  ===
# function that creates a child and adds the current node as its owner
# child_name -> String : it is the name of the child that will be created
# child_script_path -> String : it is the path of the child script that will
# be linked to the created child
func create_child(child_name: String, child_script_path: String):
	var child = Node.new()
	
	child.name = child_name
	child.script = load(child_script_path)
	
	add_child(child)
	
	child.owner = self

# ===  public function  ===
# function that runs all the tests of the testers
func run_children_complete_tests():
	print("=====   TESTING PHASE   =====\n")
	
	for child in get_children():
		if child.name != "PathsHandlerTester":
			child.run_complete_test()
