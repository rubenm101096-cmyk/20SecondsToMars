extends state
class_name launch_state

func enter() -> void:
	GameController.reset()
	ui.set_LaunchButton_visibility(true)
	ui.reset_player_information()
	ui.connect_to_LaunchButton(_on_LaunchButton_pressed)

func exit() -> void:
	ui.set_LaunchButton_visibility(false)
	ui.disconnect_from_LaunchButton(_on_LaunchButton_pressed)

func update(_delta) -> void: pass

func _on_LaunchButton_pressed() -> void:
	transitioned.emit(selector_state)
