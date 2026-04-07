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
@export var IDLE: SaifState
#Add your desired states
@export var RUN: SaifState
@export var JUMP: SaifState







## DONT TOUCH OR EDIT ANYTHING FROM BELOW CODE
## DONT TOUCH OR EDIT ANYTHING FROM BELOW CODE
## DONT TOUCH OR EDIT ANYTHING FROM BELOW CODE
## DONT TOUCH OR EDIT ANYTHING FROM BELOW CODE
## DONT TOUCH OR EDIT ANYTHING FROM BELOW CODE
func _ready() -> void:
	if initial_state == null:
		initial_state = IDLE
		active_state = initial_state
		previous_state = initial_state
	active_state._enter_state()


func _process(delta: float) -> void:
	active_state.run_process(delta)

func _physics_process(delta: float) -> void:
	active_state.run_physics_process(delta)


func change_state(new_state: Node) -> void:
	if active_state:
		active_state.exit_state()
	previous_state = active_state
	active_state = new_state
	print("Changed to: ", active_state.name)
	active_state._enter_state()
	print("New Active State _ready() Function Run")
