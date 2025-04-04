class_name InputManager
extends Node

var movement_actions : PackedStringArray = ["move_left","move_right","move_down","move_up"]

func get_player_input() -> InputPackage:
	var player_input : InputPackage = InputPackage.new()
	#movement actions are already stored in the direction vector
	player_input.inputDirection = Input.get_vector("move_left","move_right","move_down","move_up")
	
	for action in InputMap.get_actions(): #adds all non-movement actions to player_input
		if Input.is_action_pressed(action):
			if not movement_actions.has(action):
				player_input.add_action(action)
	
	return player_input
