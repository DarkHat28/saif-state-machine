@icon("res://Assets/Graphics/icons 16x16/expression.png")
class_name StateMachine
extends Node


## References to essentials
@export var state_master: StateMaster
@export var actor: Node
@export var initial_state: SaifBaseState
var active_state: SaifBaseState
var previous_state: SaifBaseState


## DONT TOUCH OR EDIT ANYTHING FROM BELOW CODE
func _ready() -> void:
	if not actor:
		push_error("Actor not set in export of StateMachine: ", self.name)
	if not initial_state:
		push_error("'Initial State' not set in export of StateMachine: ", self.name)
		return
	active_state = initial_state
	previous_state = initial_state
	active_state._enter_state()

func _process(delta: float) -> void:
	active_state.run_state_process(delta)

func _physics_process(delta: float) -> void:
	active_state.run_state_physics_process(delta)
	#print("Active State: ", active_state,name)


func change_state(new_state: Node) -> void:
	if not new_state:
		push_error("Attempted to change to null state!")
		return
	previous_state = active_state
	previous_state._exit_state()
	active_state = new_state
	new_state._enter_state()
	#print("State Changed: ",previous_state.name.to_upper(), " -> ", new_state.name.to_upper())
