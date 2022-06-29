extends Node

# docstring
# node that controls the core of the program

func _ready():
	# directories handler testing
	run_directories_handler_test()
	print("")

# function that run a complete test of the directories handler functions
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
	
	# checking if a directory is created
	var ok_create_dir = $DirectoriesHandler.create_directory("C:/Users/" \
		+ "Confectus/Documents", "New-Directory")
	print("(12) creating directory: " + str(ok_create_dir) + " : true expected")
	
	# checking if a wrong directory is created
	var bad_create_dir = $DirectoriesHandler.create_directory("C:/Users/" \
		+ "Confectus/Documents", "New-Directory")
	print("(13) creating directory: " + str(bad_create_dir) + " : false expected")
	
	# checking if a resource is saved
	var ok_save_res = $DirectoriesHandler.save_resource("C:/Users/Confectus/" \
		+ "Documents/New-Directory", "New-Resource.tres", SpriteFrames.new())
	print("(14) saving resource: " + str(ok_save_res) + " : true expected")
	
	# checking if a bad resource is saved
	var bad_save_res = $DirectoriesHandler.save_resource("C:/Users/Confectus/" \
		+ "Documents/Unknow-Dir", "New-Resource.tres", SpriteFrames.new())
	print("(15) saving resource: " + str(bad_save_res) + " : false expected")
	
	# checking if a file is moved
	var ok_move_file = $DirectoriesHandler.move_file(
		"C:/Users/Confectus/Documents/New-Directory",  
		"C:/Users/Confectus/Documents",
		"New-Resource.tres"
		)
	print("(16) moving file: " + str(ok_move_file) + " : true expected")
	
	# checking if a wrong file is moved
	var bad_move_file = $DirectoriesHandler.move_file(
		"C:/Users/Confectus/Documents/New-Directory",  
		"C:/Users/Confectus/Documents",
		"New-Resource.tres"
		)
	print("(17) moving file: " + str(bad_move_file) + " : false expected")
	
	# checking if a wrong file is moved
	var bad_move_file2 = $DirectoriesHandler.move_file(
		"C:/Users/Confectus/Documents",  
		"C:/Users/Confectus/Documents/New-Directory",
		"New-Resource-2.tres"
		)
	print("(18) moving file: " + str(bad_move_file2) + " : false expected")
	
	# checking if a file is deleted
	var ok_delete_file = $DirectoriesHandler.delete_file_or_directory("C:/Users/" \
		+ "Confectus/Documents", "New-Resource.tres")
	print("(19) deleting file: " + str(ok_delete_file) + " : true expected")
	
	# checking if a wrong file is deleted
	var bad_delete_file = $DirectoriesHandler.delete_file_or_directory("C:/Users/" \
		+ "Confectus/Documents/New-Directory", "New-Resource.tres")
	print("(20) deleting file: " + str(bad_delete_file) + " : false expected")
	
	# cheking if a directory is deleted
	var ok_delete_dir = $DirectoriesHandler.delete_file_or_directory("C:/Users/" \
		+ "Confectus/Documents", "New-Directory")
	print("(21) deleting directory: " + str(ok_delete_dir) + " : true expected")
	
	# cheking if a wrong directory is deleted
	var bad_delete_dir = $DirectoriesHandler.delete_file_or_directory("C:/Users/" \
		+ "Confectus/Documents", "New-Directory")
	print("(22) deleting directory: " + str(bad_delete_dir) + " : false expected")
