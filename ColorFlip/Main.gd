extends Node

export(int) var grid_size = 10
export(int) var grid_side = 880
enum Tile {CircleTile, SquareTile}
export(Tile) var tile_node
export(Color) var red
export(Color) var yellow
export(Color) var green
export(Color) var blue

func _ready():
	var tile_scene = get_tile(tile_node)
	var tile_side = grid_side / grid_size
	var colors = [red, green, blue, yellow]
	for j in range(grid_size):
		var row = HBoxContainer.new()
		$MainContainer/MarginContainer/TileContainer.add_child(row)
		for i in range(grid_size):
			var tile = tile_scene.instance()
			var col_id = randi() % len(colors)
			var color = colors[col_id]
			tile.get_node('Texture').modulate = color
			tile.rect_min_size = Vector2(tile_side, tile_side)
			row.add_child(tile)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func get_tile(tile):
	match tile:
		Tile.CircleTile:
			return load('res://scene/circle_tile/CircleTile.tscn')
		Tile.SquareTile:
			return load('res://scene/square_tile/SquareTile.tscn')