extends state
class_name victory_state

func enter() -> void:
	ui.set_GameSelector_visibility(false)
	ui.set_Victory_visibility(true)
	ui.connect_to_ReplayButton(_on_ReplayButton_pressed)

func exit() -> void:
	ui.set_Victory_visibility(false)
	ui.disconnect_from_ReplayButton(_on_ReplayButton_pressed)

func update(_delta) -> void: pass

func _on_ReplayButton_pressed() -> void:
	transitioned.emit(launch_state)
