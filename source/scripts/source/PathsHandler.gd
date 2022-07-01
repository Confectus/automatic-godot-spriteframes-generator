extends Node

# ===  script docstring  ===
# script that handles all the interactions between paths, including files,
# resources and folders
#
# its goal is provide a simplified way to control the files library of the OS
# 
# in that way, all the functions work with absolute paths for files, 
# resources and folders


# ===  public function  ===
# function that gets the absolute documents path of the OS as the default 
# working path
# return -> String : the absolute documents path of the OS for the current 
# user session
func get_default_working_path() -> String:
	return OS.get_system_dir(2)

# ===  public function  ===
# function that checks if the absolute given path exists, including the path of  
# files, resources and folders
# path -> String : it is the absolute path of the file, resource or folder that  
# will be checked
# return -> bool : true if the absolute given path exists, false if not
func check_path_existence(path: String) -> bool:
	var paths_handler = Directory.new()
	
	return paths_handler.dir_exists(path) or paths_handler.file_exists(path)

# ===  public function  ===
# function that checks if the folder of the absolute given path is empty or not
# path -> String : it is the absolute path of the folder that will be checked
# return -> bool : true if the folder is empty, false if not
func check_folder_is_empty(path: String) -> bool:
	var paths_handler = Directory.new()
	
	if paths_handler.open(path) == OK:
		# true parameter indicates that . and .. are ignored
		paths_handler.list_dir_begin(true)
		
		if paths_handler.get_next() == "":
			paths_handler.list_dir_end()
			return true
	
	return false

# ===  public function  ===
# function that creates and empty folder in the absolute given path
# the folder will only be created if there are no more folders with the given
# name in the absolute given path
# path -> String : it is the absolute path that will be used to create the 
# folder
# folder_name -> String : it is the name of the folder that will be created
# return -> bool : true if the folder was created, false if not
func create_folder(path: String, folder_name: String) -> bool:
	var path_existence = check_path_existence(path) 
	var folder_existence = check_path_existence(path + "/" + folder_name)
	
	if path_existence and not folder_existence:
		var paths_handler = Directory.new()
		
		if paths_handler.open(path) == OK:
			if paths_handler.make_dir(folder_name) == OK:
				return true
	
	return false

# ===  public function  ===
# function that saves the given resource in the absolute given path
# the resource will only be saved if there are no more resources with the given
# name in the absolute given path
# path -> String : it is the absolute path of the folder where the resource
# will be saved
# resource_name -> String : it is the complete name of the resource that will 
# be saved
# resource -> Resource : it is the resource that will be saved
# return -> bool : true if the resource was saved in the folder, false if not
func save_resource(path: String, resource_name: String, 
				   resource: Resource) -> bool:
	var path_existence = check_path_existence(path)  
	var resource_existence = check_path_existence(path + "/" + resource_name)
	
	if path_existence and not resource_existence:
		if ResourceSaver.save(path + "/" + resource_name, resource) == OK:
			return true
	
	return false

# ===  public function  ===
# function that moves a file, resource or folder from the absolute given source 
# path to the absolute given destination path
# source -> String : it is the absolute source path where the file, resource or 
# folder is actually located
# destination -> String : it is the absolute destination path where the the 
# file, resource or folder will be moved
# resource_name -> String : it is the name of the file, resource or folder that 
# will be moved
# return -> bool : true if the file, resource or folder was moved, false if not
func move_resource(source: String, destination: String, 
				   resource_name: String) -> bool:
	var source_existence = check_path_existence(source)  
	var destionation_existence = check_path_existence(destination)  
	var resource_existence = check_path_existence(source + "/" + resource_name)
	
	if source_existence and destionation_existence and resource_existence:
		var paths_handler = Directory.new()
		
		if paths_handler.open(source) == OK:
			var source_path = source + "/" + resource_name
			var destination_path = destination + "/" + resource_name
			
			if paths_handler.rename(source_path, destination_path) == OK:
				return true
	
	return false

# ===  public function  ===
# function that deletes a file, resource of folder in the absolute given path
# if the resource is a folder it must be empty
# path -> String : it is the absolute path where the file, resource or folder
# is located
# resource_name -> String : it is the name of the file, resource or folder that
# will be deleted
# return -> bool : true if the file, resource or folder was deleted, false 
# if not
func delete_resource(path: String, resource_name: String) -> bool:
	var path_existence = check_path_existence(path)  
	var resource_existence = check_path_existence(path + "/" + resource_name)
	
	if path_existence and resource_existence:
		var paths_handler = Directory.new()
		
		if paths_handler.open(path) == OK:
			if paths_handler.remove(resource_name) == OK:
				return true
	
	return false

# ===  public function  ===
# function that splits the given path into the root path and the resource path
# the resource can be a file, a resource or a folder
# path -> String : it is the full path that will be split
# return -> Dictionary : the first key value 'root_path' corresponds to the root 
# path and the second key value 'resource_name' corresponds to the resource name
func split_path(path: String) -> Dictionary:
	var split_values = {"root_path": null, "resource_name": null}
	
	split_values["root_path"] = path.substr(0, path.find_last("/"))
	split_values["resource_name"] = path.substr(path.find_last("/") + 1)
	
	return split_values
