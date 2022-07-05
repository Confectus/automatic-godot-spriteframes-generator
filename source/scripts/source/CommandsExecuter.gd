extends Node

# ===  script docstring  ===
# script that executes commands in the OS to work with the Blender engine
#
# its goal is to provide a simplified way to interact with the Blender engine
# located in the OS to render models and save them
# 
# in that way, all the functions work with absolute paths 


# ===  public function  ===
# function that checks if the given path has a functional version of the Blender
# engine
# path -> String : it is the absolute path of the Blender engine
# return -> bool : true if the path contains a functional version of the engine,
# false if not
func check_engine_path(path: String) -> bool:
	var command_output = []
	var exit_code = OS.execute(path, ["--version"], true, command_output)
	
	# creating a RegEx object to parse the first line of the output
	var regex = RegEx.new()
	regex.compile("^Blender \\d(\\.\\d)*\\w*")
	
	if exit_code == 0 and command_output.size() != 0:
		var regex_result = regex.search(command_output[0])
		
		if regex_result:
			return true
	
	return false
