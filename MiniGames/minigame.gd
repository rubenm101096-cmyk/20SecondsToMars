@abstract class_name minigame
extends Node2D

signal game_won

func connect_to_minigame(callable: Callable) -> void:
	game_won.connect(callable)

func disconnect_from_minigame(callable: Callable) -> void:
	game_won.disconnect(callable)

@abstract func win() -> void
