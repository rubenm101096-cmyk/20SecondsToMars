extends Button
class_name game_selector_button

signal game_button_pressed()

@export var my_minigame: PackedScene = null

func _ready() -> void:
	var scene = my_minigame.instantiate()
	if scene is not minigame:
		push_error("Button not assigned to proper minigame")

func connect_to_GameSelectorButton(callable: Callable) -> void:
	game_button_pressed.connect(callable)

func _on_pressed() -> void:
	game_button_pressed.emit(my_minigame)
