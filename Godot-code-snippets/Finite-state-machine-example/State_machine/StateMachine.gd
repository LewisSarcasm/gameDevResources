class_name StateMachine
extends Node2D

# signal is emitted when tranisitioning to a new state
# signal transitioned(state_name)

@export
var starting_state: State

var current_state: State

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent

	# Initialize to the default state
	change_state(starting_state)

# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
	
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)


"""
@export 
var starting_state: State
# starting_state.animation_name = "west-walk"
var current_state: State # need to define a bsaestate

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func init(parent: CharacterBody2D, animations: AnimatedSprite2D, move_component) -> void:
	print("fuck you")
	for child in get_children():
		child.parent = parent
		child.animations = animations
		child.move_component = move_component
	change_state(starting_state)

# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	print("state machine change state")
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
	
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	print("state machine process physics")
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	print("state machine process input, event ", event)
	
	var new_state = current_state.process_input(event)
	print("new_state in statemachine: ", new_state)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	print("state machine process frame")
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
"""
