extends state
class_name minigame_state

func enter() -> void:
	game.connect_to_minigame(_on_minigame_finished)

func exit() -> void:
	game.disconnect_from_minigame(_on_minigame_finished)

func update(delta) -> void:
	ui.update(delta)

func _on_minigame_finished(won: bool) -> void:
	var next_state = double_or_nothing_state if won else selector_state
	transitioned.emit(next_state)
