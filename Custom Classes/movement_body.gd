class_name MovementBody2D
extends CharacterBody2D

var desired_velocity : Vector2 
var acceleration : float
var max_speed : float

#ensures that any nodes setting our properties run first regardless of position in the scene tree
func _ready() -> void: 
	process_priority = 1

func _physics_process(delta: float) -> void:
	
	var accel_dir = desired_velocity - velocity
	var max_accel = min(acceleration, accel_dir.length()) #prevents overshooting target velocity
	
	velocity += accel_dir.normalized() * max_accel*delta #accelerating must be framerate independent
	velocity.limit_length(max_speed)
	
	move_and_slide()

func set_properties(desired_vel, accel, top_speed) -> void:
	desired_velocity = desired_vel
	acceleration = accel
	max_speed = top_speed
