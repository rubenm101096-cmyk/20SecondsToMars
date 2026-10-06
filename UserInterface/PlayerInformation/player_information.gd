extends Control
class_name player_information

@onready var timer_label: Label = $TimerLabel
@onready var distance_label: Label = $DistanceLabel
@onready var velocity_label: Label = $VelocityLabel

@export var timer: Timer = null

func reset() -> void:
	timer_label.text = _get_timer_text(GameController.total_time)
	distance_label.text = _get_distance_text(GameController.total_distance)
	velocity_label.text = _get_velocity_text(GameController.initial_velocity)

func update_player_information(delta: float) -> void:
	var time_left: float = timer.time_left
	var velocity: float = GameController.velocity
	var distance: float = GameController.distance
	
	timer_label.text = _get_timer_text(time_left)
	velocity_label.text = _get_velocity_text(velocity)
	
	if distance > 0:
		var new_distance: float = distance - velocity * delta
		GameController.distance = new_distance
		distance = GameController.distance
		distance_label.text = _get_distance_text(distance)

func _get_timer_text(time: float) -> String:
	return "%02d:%02d" % [int(time), (time - int(time))*100]

func _get_distance_text(distance: float) -> String:
	return "%.2fM km" % distance

func _get_velocity_text(velocity: float) -> String:
	return "%.2fM km/s" % velocity
