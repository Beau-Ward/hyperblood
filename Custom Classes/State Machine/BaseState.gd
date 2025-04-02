class_name BaseState
extends Node

var next_state : BaseState 

func run_state() -> BaseState:
	next_state = null
	state_process()
	return next_state

func state_process():
	print("state_process has not been set. check the names of your virtual functions.")
