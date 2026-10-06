extends Control
class_name game_selector

signal game_selected(new_game_scene: PackedScene)

"Probably change to pseudorandomized minigames?"
var game_buttons: Array[game_selector_button] = []

func _ready() -> void:
	for child: Node in get_children():
		if child is game_selector_button:
			child.connect_to_GameSelectorButton(_on_GameButton_pressed)
			game_buttons.append(child)

func connect_to_GameSelector(callable: Callable) -> void:
	game_selected.connect(callable)

func disconnect_from_GameSelector(callable: Callable) -> void:
	game_selected.disconnect(callable)

func _on_GameButton_pressed(game_button_scene: PackedScene):
	game_selected.emit(game_button_scene)
