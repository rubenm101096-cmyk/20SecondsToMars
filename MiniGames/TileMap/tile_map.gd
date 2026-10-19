extends Node2D
class_name tile_map

signal tilemap_completed

var my_tiles: Dictionary[tile, bool] = {}

func _ready() -> void:
	for child in get_children():
		if child is tile and child.is_relevant_tile():
			child.tile_rotated.connect(_tile_rotated)
			my_tiles[child as tile] = child.is_correct_position()

func _tile_rotated(some_tile: tile, correct: bool) -> void:
	my_tiles[some_tile] = correct
	if _are_all_tiles_correct(my_tiles.values()):
		tilemap_completed.emit()

func _are_all_tiles_correct(tiles: Array[bool]) -> bool:
	return tiles.all(func(e): return e)
