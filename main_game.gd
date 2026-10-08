extends Node2D
class_name main_game

signal minigame_finished(won: bool)

@onready var timer: Timer = $Timer
@onready var my_state_machine: state_machine = $StateMachine
@onready var blur_shader: Control = $BlurShader

var current_minigame: minigame = null

func _ready() -> void:
	GameController.connect_to_voyage(_on_voyage_completed)

func start_timer() -> void:
	if timer.is_stopped():
		timer.start(GameController.total_time)
		timer.timeout.connect(_on_timer_timeout)

func set_new_minigame(new_minigame_scene: PackedScene):
	current_minigame = new_minigame_scene.instantiate()
	var main = get_tree().current_scene
	main.add_child(current_minigame)
	move_child(current_minigame, 0)
	current_minigame.global_position = global_position
	current_minigame.connect_to_minigame(_on_minigame_finished)

func connect_to_minigame(callable: Callable) -> void:
	minigame_finished.connect(callable)

func disconnect_from_minigame(callable: Callable) -> void:
	minigame_finished.disconnect(callable)

func exit_minigame() -> void:
	blur_shader.set_visible(false)
	_dispose_current_minigame()

func _on_minigame_finished(won: bool) -> void:
	if won:
		blur_shader.set_visible(true)
	else:
		_dispose_current_minigame()
	
	minigame_finished.emit(won)

func _on_voyage_completed() -> void:
	_dispose_current_minigame()
	timer.stop()
	my_state_machine.go_to_victory_state()

func _on_timer_timeout() -> void:
	_dispose_current_minigame()
	my_state_machine.go_to_gameover_state()

func _dispose_current_minigame() -> void:
	if current_minigame != null:
		current_minigame.disconnect_from_minigame(_on_minigame_finished)
		current_minigame.queue_free()
