class_name Controller
extends Node

# docstring
# class that controls the core of the program

func _ready():
	# directories handler testing
	run_directories_handler_test()
	print("")

func run_directories_handler_test():
	print("=====  directories handler testing  =====")
	print("")
	
	# getting initial directory
	var initial_dir = $DirectoriesHandler.get_default_working_directory()
	print("(1) current working directory: " + initial_dir)
	
	# changing directory
	var ok_dir_change = $DirectoriesHandler.set_default_working_directory("C:/Users/" \
		+ "Confectus/Desktop")
	print("(2) changing directory: " + str(ok_dir_change) + " : true expected")
	
	# changing directory to a wrong one
	var bad_dir_change = $DirectoriesHandler.set_default_working_directory("C:/Users/" \
		+ "Andres/Desktop")
	print("(3) changing directory: " + str(bad_dir_change) + " : false expected")
	
	# changing directory to a wrong file
	var bad_dir_change2 = $DirectoriesHandler.set_default_working_directory("C:/Users/" \
		+ "Confectus/Documents/Games/Snes9x/changes.txt")
	print("(4) changing directory: " + str(bad_dir_change2) + " : false expected")
	
	# getting the changed directory
	var new_dir = $DirectoriesHandler.get_default_working_directory()
	print("(5) current working directory: " + new_dir)
	
	# checking if a directory exists
	var ok_ck_dir =  $DirectoriesHandler.check_directory_existence("C:/Users/" \
		+ "Confectus/Documents/Apps")
	print("(6) checking directory: " + str(ok_ck_dir) + " : true expected")
	
	# checking if a wrong directory exists
	var bad_ck_dir =  $DirectoriesHandler.check_directory_existence("C:/Users/" \
		+ "Confectus/Documents/DefaultDirectory")
	print("(7) checking directory: " + str(bad_ck_dir) + " : false expected")
	
	# checking if a file exists
	var ok_ck_file = $DirectoriesHandler.check_file_existence("C:/Users/" \
		+ "Confectus/Documents/Games/Snes9x/changes.txt")
	print("(8) checking file: " + str(ok_ck_file) + " : true expected")
	
	# checking if a wrong file exists
	var bad_ck_file = $DirectoriesHandler.check_file_existence("C:/Users/" \
		+ "Confectus/Documents/Games/Snes9x/default.txt")
	print("(9) checking file: " + str(bad_ck_file) + " : false expected")
	
	# checking if an empty directory is empty
	var ok_empty_dir = $DirectoriesHandler.check_directory_is_empty("C:/Users/" \
		+ "Confectus/Documents/Zoom")
	print("(10) empty directory: " + str(ok_empty_dir) + " : true expected")
	
	# checking if a full directory is empty
	var bad_empty_dir = $DirectoriesHandler.check_directory_is_empty("C:/Users/" \
		+ "Confectus/Documents")
	print("(11) empty directory: " + str(bad_empty_dir) + " : false expected")
