class_name DirectoriesHandler
extends Node

# docstring
# class that handles all the interactions with files and directories

onready var _directories_handler = Directory.new()

func _ready():
	# opening documents path by default
	if self._directories_handler.open(OS.get_system_dir(2)) != OK:
		self.queue_free()

# method that sets the default working directory value
# path -> String : it is the absolute path of the working directory
# return -> bool : true if the configuration was successful, false if not
func set_default_working_directory(path: String) -> bool:
	var path_is_a_file = self.check_file_existence(path)
	var path_is_a_directory = self.check_directory_existence(path)
	
	if not path_is_a_file and path_is_a_directory:
		if self._directories_handler.change_dir(path) == OK:
			return true
	
	return false

# method that gets the default working directory value
# return -> String : the current default working directory
func get_default_working_directory() -> String:
	return self._directories_handler.get_current_dir()

# method that checks if the given directory exists
# path -> String : it is the absolute path of the directory
# return -> bool : true if the directory exists, false if not
func check_directory_existence(path: String) -> bool:
	return self._directories_handler.dir_exists(path)

# method that checks if the given file exists
# path -> String : it is the absolute path of the file
# return -> bool : true if the file exists, false if not
func check_file_existence(path: String) -> bool:
	return self._directories_handler.file_exists(path)

# method that checks if the given directory is empty
# path -> String : it is the absolute path of the directory
# return -> bool : true if the directory is empty, false if not
func check_directory_is_empty(path: String) -> bool:
	var temporal_handler = Directory.new()
	
	if temporal_handler.open(path) == OK:
		# true parameter indicates that . and .. are ignored
		temporal_handler.list_dir_begin(true)
		
		if temporal_handler.get_next() == "":
			temporal_handler.list_dir_end()
			return true
	
	return false
