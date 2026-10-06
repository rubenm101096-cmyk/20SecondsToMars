extends Control
class_name user_interface

@onready var player_information: player_information = $PlayerInformation
@onready var launch_button: Button = $LaunchButton
@onready var game_over_control: Control = $GameOver
@onready var restart_button: Button = $GameOver/RestartButton
@onready var selector: game_selector = $GameSelector
@onready var victory: Control = $Victory
@onready var replay_button: Button = $Victory/ReplayButton

func _ready() -> void:
	launch_button.hide()
	game_over_control.hide()

func update(delta: float) -> void:
	player_information.update_player_information(delta)

func set_LaunchButton_visibility(visible: bool) -> void:
	launch_button.set_visible(visible)

func set_GameOver_visibility(visible: bool) -> void:
	game_over_control.set_visible(visible)

func set_GameSelector_visibility(visible: bool) -> void:
	selector.set_visible(visible)

func set_Victory_visibility(visible: bool) -> void:
	victory.set_visible(visible)

func connect_to_LaunchButton(callable: Callable) -> void:
	launch_button.pressed.connect(callable)

func connect_to_RestartButton(callable: Callable) -> void:
	restart_button.pressed.connect(callable)

func connect_to_GameSelector(callable: Callable) -> void:
	selector.connect_to_GameSelector(callable)

func connect_to_ReplayButton(callable: Callable) -> void:
	replay_button.pressed.connect(callable)

func disconnect_from_LaunchButton(callable: Callable) -> void:
	launch_button.pressed.disconnect(callable)

func disconnect_from_RestartButton(callable: Callable) -> void:
	restart_button.pressed.disconnect(callable)

func disconnect_from_GameSelector(callable: Callable) -> void:
	selector.disconnect_from_GameSelector(callable)

func disconnect_from_ReplayButton(callable: Callable) -> void:
	replay_button.pressed.disconnect(callable)

func reset_player_information() -> void:
	player_information.reset()
 
