extends minigame
class_name minigame_test_1

func win() -> void:
	GameController.modify_velocity_by(10.0)
	game_won.emit()

func _on_button_pressed() -> void:
	win()
