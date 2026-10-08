extends minigame
class_name minigame_test_1

func win() -> void:
	GameController.current_winnings = 10.0
	game_finished.emit(true)

func lose() -> void: pass

func _on_button_pressed() -> void:
	win()
