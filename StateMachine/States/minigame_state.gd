extends state
class_name minigame_state

func enter() -> void:
	game.connect_to_timer_timeout(_on_Timer_finished)
	game.connect_to_minigame(_on_minigame_finished)

func exit() -> void:
	game.disconnect_from_timer_timeout(_on_Timer_finished)
	game.disconnect_from_minigame(_on_minigame_finished)

func update(delta) -> void:
	ui.update(delta)

func _on_minigame_finished() -> void:
	transitioned.emit(selector_state)

func _on_Timer_finished() -> void:
	transitioned.emit(gameover_state)
