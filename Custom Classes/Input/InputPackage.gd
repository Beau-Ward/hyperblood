class_name InputPackage #Simple interface for sending input data between nodes.
extends Node

var InputDirection : Vector2 = Vector2.ZERO
var InputActions : Array

func add_action(action : String) -> void:
	if not InputActions.has(action): #I dont want duplicate inputs in my array.
		InputActions.append(action)

func clear_action(action : String) -> void:
	InputActions.erase(action)
