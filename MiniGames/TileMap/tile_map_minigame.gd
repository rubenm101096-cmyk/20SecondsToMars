extends minigame
class_name tilemap_minigame

const tilemap_folder_path: String = "res://MiniGames/TileMap/TilemapSets/"

"JSON?"
enum tile_direction {NONE, NORTH, EAST, SOUTH, WEST}

@onready var marker: Marker2D = $Marker

func win() -> void:
	GameController.current_winnings = 50
	game_finished.emit(true)

func lose() -> void: pass

func _ready() -> void:
	var tilemap: String = _get_random_tilemap(tilemap_folder_path)
	var tilemap_scene: tile_map = _load_tilemap(tilemap_folder_path + tilemap, self)
	tilemap_scene.global_position = marker.global_position
	tilemap_scene.tilemap_completed.connect(win)

static func get_next_tile_direction(direction: tile_direction) -> tile_direction:
	if direction + 1 <= tile_direction.WEST:
		direction += 1
	else:
		direction = tile_direction.NORTH
	return direction

static func get_opposite_direction(direction: tile_direction) -> tile_direction:
	match direction:
		tile_direction.NORTH:
			return tile_direction.SOUTH
		tile_direction.SOUTH:
			return tile_direction.NORTH
		tile_direction.EAST:
			return tile_direction.WEST
		tile_direction.WEST:
			return tile_direction.EAST
	
	return tile_direction.NONE

func _load_tilemap(path: String, parent: Node) -> Node:
	var result: Node = null
	if ResourceLoader.exists(path):
		result = ResourceLoader.load(path).instantiate()
		if result:
			parent.add_child(result)
	return result

func _get_random_tilemap(path: String) -> String:
	var dir: DirAccess = DirAccess.open(path)
	assert(dir != null, "TileMap folder path not properly set")
	var files: PackedStringArray = dir.get_files()
	return files[randi() % files.size()]
