@icon("res://Assets/Graphics/icons 16x16/arguments.png")
class_name SaifBaseState
extends Node

#signal state_entered()
#signal state_exited()

@export var state_animation: StringName
@export var player_animation: Node

@onready var state_machine: SaifStateMachine = get_parent() as SaifStateMachine
@onready var actor: Node2D = state_machine.actor


## Add Extra Node refrence here, based on requirements...
#@onready var player_animation: AnimatedSprite2D = %PlayerAnimation

func _ready() -> void:
	# Error checking
	if state_animation == "":
		push_warning("State animation not assigned for current State: ", name.to_upper())
	if not player_animation:
		push_warning("Player animation node not assigned in state: ", name.to_upper())
	if not state_machine:
		push_error("State machine parent not found for state: ", name.to_upper())


## Input function for each State Class gets called from here
## Write State specific Input logic here
func _input(event: InputEvent) -> void:
	if state_machine.active_state == self:
		_handle_input(event)

func run_state_process(delta: float) -> void:
	_state_process(delta)

func run_state_physics_process(delta: float) -> void:
	_state_physics_process(delta)
	_state_transition(delta)


func _play_animation() -> void: # Write Animation logic here
	if player_animation and state_animation:
		player_animation.play(state_animation)
		#print("Playing Animation: ", state_animation)
	else:
		push_warning("Animation skipped: player_animation or state_animation missing in ", name.to_upper())


## Overridable methods : These functions called from class SaifBaseState
func _handle_input(_event: InputEvent) -> void: pass # Write Input logic here If State Transition by Input
func _state_process(_delta: float) -> void: pass # Write State logic here,that active state needs method _process()
func _state_physics_process(_delta: float) -> void: pass # Write State logic here,that active state needs method _physics_process()
func _state_transition(_delta: float) -> void: pass # Write Transition logic where state changes based on condition


# These functions called from class SaifStateMachine
func _enter_state() -> void:
	print("Entered state -> ", self.name.to_upper())
	_play_animation()

func _exit_state() -> void:
	print("\n", "Exited state <- ", self.name.to_upper())



## HELPER FUNCTIONS
func change_state(state: Node) -> void:
	state_machine.change_state(state)
