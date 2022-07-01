extends Node

# ===  script docstring  ===
# script that controls the core of the program, including functionalities and
# testing phases


const TESTERS_HANDLER_NAME = "TestersHandler"
const TESTERS_HANDLER_PATH = "res://scripts/test/TestersHandler.gd"

# ===  initial process  ===
func _init():
	# creating a testers handler child node to control all the testers
	var testers_handler = Node.new()
	
	testers_handler.name = TESTERS_HANDLER_NAME
	testers_handler.script = load(TESTERS_HANDLER_PATH)	
	
	add_child(testers_handler)
	
	testers_handler.owner = self

# === entering tree function  ===
func _ready():
	# running a complete test for each current implementation
	$TestersHandler.run_children_complete_tests()
