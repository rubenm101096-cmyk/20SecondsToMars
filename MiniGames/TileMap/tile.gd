extends Sprite2D
class_name tile

const rotation_velocity: float = 450
const directions: Dictionary[int, String] = {0: "NORTH", 90: "EAST", 180: "SOUTH", 270: "WEST"}

signal tile_rotated(this_tile: tile, correct_direction: bool)

@export var desired_direction: tilemap_minigame.tile_direction = tilemap_minigame.tile_direction.NONE
@export var is_symmetrical: bool = false

var current_direction: tilemap_minigame.tile_direction = tilemap_minigame.tile_direction.NONE
var rotating: bool = false
var selected_rotation: float = 0.0

func _ready() -> void:
	var new_rotation: int = _get_random_direction()
	rotation_degrees = new_rotation
	current_direction = tilemap_minigame.tile_direction.get(directions[new_rotation])

func _process(delta: float) -> void:
	if rotating:
		rotation_degrees += rotation_velocity * delta
		if rotation_degrees >= selected_rotation:
			_stop_rotation()

"TODO: cleaner code"
func is_correct_position() -> bool:
	if desired_direction == tilemap_minigame.tile_direction.NONE:
		return true
	if is_symmetrical and (current_direction == desired_direction or current_direction == tilemap_minigame.get_opposite_direction(desired_direction)): 
		return true
	if not is_symmetrical and current_direction == desired_direction:
		return true
	
	return false

func is_relevant_tile() -> bool:
	return desired_direction != tilemap_minigame.tile_direction.NONE

func _on_tile_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not rotating:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_play_rotation()

func _play_rotation() -> void:
	rotating = true
	selected_rotation = rotation_degrees + 90

func _stop_rotation() -> void:
	rotating = false
	rotation_degrees = selected_rotation
	current_direction = tilemap_minigame.get_next_tile_direction(current_direction)
	
	if is_relevant_tile():
		tile_rotated.emit(self, is_correct_position())

func _get_random_direction() -> int:
	var size: int = directions.size()
	return directions.keys()[randi() % size]
