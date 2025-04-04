class_name InputPackage #Simple interface for sending input data between nodes.
extends Node

var inputDirection : Vector2 = Vector2.ZERO
var inputActions : Array

func add_action(action : String) -> void:
	if not inputActions.has(action): #I dont want duplicate inputs in my array.
		inputActions.append(action)

func clear_action(action : String) -> void:
	inputActions.erase(action)
