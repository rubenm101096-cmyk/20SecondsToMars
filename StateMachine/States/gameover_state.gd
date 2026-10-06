extends state
class_name gameover_state

func enter() -> void: 
	ui.set_GameOver_visibility(true)
	ui.connect_to_RestartButton(_on_RestartButton_pressed)

func exit() -> void:
	ui.set_GameOver_visibility(false)
	ui.disconnect_from_RestartButton(_on_RestartButton_pressed)

func update(_delta) -> void: pass

func _on_RestartButton_pressed() -> void:
	transitioned.emit(launch_state)
