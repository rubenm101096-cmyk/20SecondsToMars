extends state
class_name double_or_nothing_state

func enter() -> void:
	ui.set_DoubleOrNothing_visibility(true)
	ui.connect_to_DoubleOrNothing(_on_DoubleOrNothing_finished)

func exit() -> void:
	ui.set_DoubleOrNothing_visibility(false)
	ui.disconnect_from_DoubleOrNothing(_on_DoubleOrNothing_finished)
	game.exit_minigame()

func update(delta) -> void:
	ui.update(delta)

func _on_DoubleOrNothing_finished(final_winnings: float) -> void:
	GameController.modify_velocity_by(final_winnings)
	transitioned.emit(selector_state)
