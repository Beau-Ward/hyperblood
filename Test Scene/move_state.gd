extends BaseState

@export var move_speed : float =  700

func run_state():
	var desired_velocity :Vector2 = input_handler.get_player_input().inputDirection * move_speed
	desired_velocity.y *= -1 #godot's y axis is flipped for some stupid reason. why juan, why. 
	
	body_node.set_properties(desired_velocity, move_speed*10, 700)
	#body_node.velocity = desired_velocity
