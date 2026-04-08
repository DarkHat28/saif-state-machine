@icon("res://Assets/Graphics/icons 16x16/expression.png")
class_name SaifStateMachine
extends Node


# References to essentials
@export var actor: Node2D
@export var initial_state: Node
var active_state: Node
var previous_state: Node

# References to all states
@export_group("States")
@export var IDLE: SaifBaseState
#Add your desired states
@export var RUN: SaifBaseState
@export var JUMP: SaifBaseState
@export var FALL: SaifBaseState
@export var FLOAT: SaifBaseState



## DONT TOUCH OR EDIT ANYTHING FROM BELOW CODE
func _ready() -> void:
	if not actor:
	#if actor == null:
		actor = owner
		#print("Actor Name: ", actor)
		push_error("Actor not set in export of SaifStateMachine.")
	if initial_state == null:
		initial_state = IDLE
	active_state = initial_state
	previous_state = initial_state
	active_state._enter_state()


func _process(delta: float) -> void:
	active_state.run_state_process(delta)

func _physics_process(delta: float) -> void:
	active_state.run_state_physics_process(delta)
	##print("Active State: ", active_state,name)

func change_state(new_state: Node) -> void:
	if not new_state:
		push_error("Attempted to change to null state!")
		return
	previous_state = active_state
	previous_state._exit_state()
	active_state = new_state
	new_state._enter_state()
	print("State Changed: ",previous_state.name.to_upper(), " -> ", new_state.name.to_upper())
