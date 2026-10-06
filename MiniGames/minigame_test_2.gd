extends minigame
class_name minigame_test_2

var buttons: Dictionary[Button, bool] = {}

func _ready() -> void:
	for button:Button in $ButtonControl.get_children():
		buttons[button] = false
		button.toggled.connect(_on_button_toggled.bind(button))

func win() -> void:
	GameController.modify_velocity_by(20.0)
	game_won.emit()

func _on_button_toggled(toggled: bool, button: Button) -> void:
	buttons[button] = toggled
	var values: Array[bool] = buttons.values()
	if values.all(func(e): return e == true):
		win()
