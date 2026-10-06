extends Node2D
class_name main_game

signal minigame_won

@onready var timer: Timer = $Timer
@onready var my_state_machine: state_machine = $StateMachine

var current_minigame: minigame = null

func _ready() -> void:
	GameController.connect_to_voyage(_on_voyage_completed)

func start_timer() -> void:
	if timer.is_stopped():
		timer.start(GameController.total_time)

func set_new_minigame(new_minigame_scene: PackedScene):
	current_minigame = new_minigame_scene.instantiate()
	var main = get_tree().current_scene
	main.add_child(current_minigame)
	current_minigame.global_position = global_position
	current_minigame.connect_to_minigame(_on_minigame_won)

func connect_to_timer_timeout(callable: Callable) -> void:
	timer.timeout.connect(callable)

func connect_to_minigame(callable: Callable) -> void:
	minigame_won.connect(callable)

func disconnect_from_timer_timeout(callable: Callable) -> void:
	timer.timeout.disconnect(callable)

func disconnect_from_minigame(callable: Callable) -> void:
	minigame_won.disconnect(callable)

func _on_minigame_won() -> void:
	_dispose_current_minigame()
	minigame_won.emit()

func _on_voyage_completed() -> void:
	_dispose_current_minigame()
	timer.stop()
	my_state_machine.go_to_victory_state()

func _dispose_current_minigame() -> void:
	if current_minigame != null:
		current_minigame.disconnect_from_minigame(_on_minigame_won)
		current_minigame.queue_free()
