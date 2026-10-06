@abstract class_name state
extends Node

var ui: user_interface = null
var game: main_game = null

signal transitioned(new_state: GDScript)

func setup(ui_ref: user_interface, game_ref: main_game):
	ui = ui_ref
	game = game_ref

func connect_transition_to(callable: Callable) -> void:
	transitioned.connect(callable)

@abstract func enter() -> void
@abstract func exit() -> void
@abstract func update(delta) -> void
