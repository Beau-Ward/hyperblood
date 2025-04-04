@tool #makes code run in the editor as well so I can push config warnings
class_name StateManager
extends Node

@export var default_state : BaseState:
	set(value): #makes it so that when variable is set the engine clears config warnings
		default_state = value
		if Engine.is_editor_hint():
			update_configuration_warnings()
@export var movement_body : MovementBody2D:
	set(value): #makes it so that when variable is set the engine clears config warnings
		movement_body = value
		if Engine.is_editor_hint():
			update_configuration_warnings()
@export var input_manager : InputManager:
	set(value): #makes it so that when variable is set the engine clears config warnings
		input_manager = value
		if Engine.is_editor_hint():
			update_configuration_warnings()
#configuration warnings are important for this class specifically because
#it DEPENDS upon other nodes to work
func _get_configuration_warnings() -> PackedStringArray:
	var warnings : PackedStringArray
	if not default_state is BaseState: #specifically pushes warnings when default state is not set
		warnings.append("Default State must be set to a state node!!! \n") 
	if not movement_body is MovementBody2D: #pushes warnings for when movement body isnt set
		warnings.append("Movement Body must be set to a movement body node!!! \n")
	if not input_manager is InputManager:
		warnings.append("Input Manager must be set to an input manager node!!! \n")
	return warnings

var current_state : BaseState

func _ready() -> void:
	if Engine.is_editor_hint():#ensures that state logic only runs in game not in editor
		return
	
	current_state = default_state
	
	for state : BaseState in get_children():
		state.input_handler = input_manager
		state.body_node = movement_body

func _physics_process(_delta: float) -> void:
	if Engine.is_editor_hint(): #ensures that state logic only runs in game not in editor
		return
	
	
	var next_state = current_state.run_state()
	
	if next_state:
		change_state(next_state)

func change_state(next_state : BaseState):
	current_state.exit_state()
	current_state = next_state
	current_state.enter_state()
