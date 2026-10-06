extends Node
class_name state_machine

@export var initial_state: GDScript = null
@export var ui: user_interface = null
@export var game: main_game = null

var state: state
var previous_state: state

func _ready() -> void:
	assert(initial_state != null ,"Initial state has to be set")
	_transition_state(initial_state)

func _process(delta: float) -> void:
	state.update(delta)

func go_to_victory_state() -> void:
	_transition_state(victory_state)

func _transition_state(new_state_class: GDScript) -> void:
	var new_state = new_state_class.new()
	assert(new_state is state, "New state to transition has to be of class state")
	previous_state = state
	state = new_state
	state.setup(ui, game)
	state.connect_transition_to(_transition_state)
	state.enter()
	if previous_state != null:
			previous_state.exit()
