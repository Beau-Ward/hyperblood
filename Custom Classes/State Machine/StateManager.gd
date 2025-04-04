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
#configuration warnings are important for this class specifically because
#it DEPENDS upon other nodes to work
func _get_configuration_warnings() -> PackedStringArray:
	if default_state != BaseState: #specifically pushes warnings when default state is not set
		return ["Default State must be set to a state node!!!"]
	if movement_body != MovementBody2D: #pushes warnings for when movement body isnt set
		return ["Movement Body must be set to a movement body node!!!"]
	return []

var current_state : BaseState

func _ready() -> void:
	current_state = default_state

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint(): #ensures that state logic only runs in game not in editor
		return
	
	var next_state = current_state.run_state()
	
	if next_state:
		change_state(next_state)

func change_state(next_state : BaseState):
	current_state.exit_state()
	current_state = next_state
	current_state.enter_state()
