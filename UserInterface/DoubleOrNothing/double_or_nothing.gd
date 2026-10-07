extends Control
class_name double_or_nothing

const possible_outcomes: Array[int] = [0, 2]

signal choice_made(result: float)

@onready var win_amount_label: Label = $WinAmountLabel

func connect_to_DoubleOrNothing(callable: Callable) -> void:
	win_amount_label.text = _get_current_winnings_text(GameController.current_winnings)
	choice_made.connect(callable)

func disconnect_from_DoubleOrNothing(callable: Callable) -> void:
	choice_made.disconnect(callable)

func _on_don_button_pressed() -> void:
	choice_made.emit(GameController.current_winnings * possible_outcomes.pick_random())

func _on_keep_winning_button_pressed() -> void:
	choice_made.emit(GameController.current_winnings)

func _get_current_winnings_text(current_winnings: float) -> String:
	return "%.2fM km/s" % current_winnings
