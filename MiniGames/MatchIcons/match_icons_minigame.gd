extends minigame
class_name match_icons_minigame

enum icon_type {NONE, CIRCLE, TRIANGLE, SQUARE, PENTAGON}

@onready var screen: icon_screen = $IconScreen
@onready var buttons: Control = $IconButtons

var selected_buttons: Array[icon_type] = []

func _ready() -> void:
	for button: Button in buttons.get_children():
		button.toggled.connect(_on_button_toggled.bind(button))

func win() -> void:
	GameController.current_winnings = 25
	game_finished.emit(true)

func lose() -> void:
	game_finished.emit(false)

func _on_button_toggled(toggled: bool, button: icon_button):
	if not selected_buttons.has(button.type) and toggled:
		selected_buttons.append(button.type)
	elif selected_buttons.has(button.type) and not toggled:
		selected_buttons.erase(button.type)


func _on_match_button_pressed() -> void:
	selected_buttons.sort()
	screen.types_shown.sort()
	if selected_buttons == screen.types_shown:
		win()
	else:
		lose()
