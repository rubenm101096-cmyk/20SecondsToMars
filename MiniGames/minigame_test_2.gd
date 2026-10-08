extends minigame
class_name minigame_test_2

var buttons: Dictionary[Button, bool] = {}

func _ready() -> void:
	for button:Button in $ButtonControl.get_children():
		buttons[button] = false
		button.toggled.connect(_on_button_toggled.bind(button))

func win() -> void:
	GameController.current_winnings = 25.0
	game_finished.emit(true)

func lose() -> void: pass

func _on_button_toggled(toggled: bool, button: Button) -> void:
	buttons[button] = toggled
	var values: Array[bool] = buttons.values()
	if values.all(func(e): return e == true):
		win()
