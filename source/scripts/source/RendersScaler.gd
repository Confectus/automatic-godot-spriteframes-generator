extends Node

# ===  script docstring  ===
# script that scales renders according to the given dimensions
#
# its goal is to provide a simplified way to scale renders passed as Godot 
# textures

const MAX_SIZE = 16384

# ===  public function  ===
# function that gets the height of a texture
# render -> Texture : the texture that will be used to get the height
# return -> int : the height of the texture
func get_render_height(render: Texture) -> int:
	return render.get_height()

# ===  public function  ===
# function that gets the width of a texture
# render -> Texture : the texture that will be used to get the width
# return -> int : the width of the texture
func get_render_width(render: Texture) -> int:
	return render.get_width()

# ===  public function  ===
# function that checks if scaling a texture is possible according to the given 
# dimensions
# render -> Texture : the texture that will be used to check the scaling 
# possibilities
# height -> int : the height that will be used for the scaling
# width -> int : the width that will be used for the scaling
# return -> bool : true if scaling is possible, false if not
func scaling_is_possible(render: Texture, height: int, width: int) -> bool:
	if render != null:
		if height <= MAX_SIZE and width <= MAX_SIZE:
			return true
	
	return false

# ===  public function  ===
# function that scales a PNG render according to the given dimensions
# render -> Texture : the texture that will be scaled
# width -> int : the width that will be used for the scaling
# height -> int : the height that will be used for the scaling
# return -> Texture : the scaled texture
func scale_render(render: Texture, width: int, height: int) -> Texture:
	var cloned_texture = render.duplicate()
	var image : Image = cloned_texture.get_data()
	image.resize(width, height, Image.INTERPOLATE_LANCZOS)
	
	var new_texture = ImageTexture.new()
	new_texture.create_from_image(image)
	
	return new_texture
