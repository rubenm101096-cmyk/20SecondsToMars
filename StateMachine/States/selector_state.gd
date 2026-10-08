extends state
class_name selector_state

func enter() -> void:
	ui.set_GameSelector_visibility(true)
	ui.connect_to_GameSelector(_on_Minigame_selected)
	game.start_timer()

func exit() -> void:
	ui.set_GameSelector_visibility(false)
	ui.disconnect_from_GameSelector(_on_Minigame_selected)

func update(delta) -> void:
	ui.update(delta)

func _on_Minigame_selected(new_game_scene: PackedScene) -> void:
	game.set_new_minigame(new_game_scene)
	transitioned.emit(minigame_state)
