@abstract class_name minigame
extends Node2D

signal game_finished(won: bool)

func connect_to_minigame(callable: Callable) -> void:
	game_finished.connect(callable)

func disconnect_from_minigame(callable: Callable) -> void:
	game_finished.disconnect(callable)

@abstract func win() -> void
@abstract func lose() -> void
