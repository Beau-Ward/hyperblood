class_name MovementBody2D
extends CharacterBody2D

var desired_velocity : Vector2
var acceleration : float
var max_speed : float

func move_body(delta: float) -> void:
	
	var accel_dir = desired_velocity - velocity
	var max_accel = min(acceleration, accel_dir.length())
	
	velocity += accel_dir.normalized() * max_accel*delta
	
	if velocity.length() > max_speed:
		velocity = velocity.normalized() * max_speed
	
	move_and_slide()

func set_properties(desired_vel, accel, top_speed) -> void:
	desired_velocity = desired_vel
	acceleration = accel
	max_speed = top_speed
