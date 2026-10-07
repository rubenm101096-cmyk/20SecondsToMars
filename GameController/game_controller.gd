extends Node
class_name game_controller

signal voyage_completed

const total_time: float = 20
const total_distance: float = 225.0
const initial_velocity: float = 5.0

var distance: float:
	get:
		return distance
	set(value):
		distance = max(value, 0)
		if distance == 0:
			voyage_completed.emit()

var velocity: float:
	get:
		return velocity

"TODO: Implement dictionary to classify type of winnings"
var current_winnings: float:
	get:
		return current_winnings
	set(value):
		current_winnings = value

func _ready() -> void:
	distance = total_distance
	velocity = initial_velocity

func reset() -> void:
	distance = total_distance
	velocity = initial_velocity

"Check possible exceptions (velocity < 0, etc)"
func modify_velocity_by(velocity_modifier: float) -> void:
	velocity += velocity_modifier
	current_winnings = 0

func connect_to_voyage(callable: Callable) -> void:
	voyage_completed.connect(callable)
