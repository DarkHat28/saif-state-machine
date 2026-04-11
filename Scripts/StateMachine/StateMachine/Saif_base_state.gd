@icon("res://Assets/Graphics/icons 16x16/arguments.png")
class_name SaifBaseState
extends Node


signal state_entered(state: SaifBaseState)
signal state_exited(state: SaifBaseState)


@export var state_animation: StringName
@export var animation_player: Node

@onready var state_machine: StateMachine = get_parent() as StateMachine
@onready var state_master: StateMaster = state_machine.state_master as StateMaster
@onready var actor: Node = state_machine.actor

## Add Extra Node refrence here, based on requirements...
#@onready var player_animation: AnimatedSprite2D = %PlayerAnimation

func _ready() -> void:
	add_to_group("SAIF_STATE")
	# Error checking
	if state_animation == "":
		push_warning("State animation not assigned for current State: ", name.to_upper())
	if not animation_player:
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
	if state_animation and animation_player:
		animation_player.play(state_animation)
	else:
		push_warning("Animation skipped: animation_player or state_animation missing in ", name.to_upper())


# These functions called from class SaifStateMachine
func _enter_state() -> void:
	state_entered.emit(self)
	_play_animation()
	#print("Entered state -> ", self.name.to_upper())

func _exit_state() -> void:
	state_exited.emit(self)
	#print("\n", "Exited state <- ", self.name.to_upper())

## Overridable methods : These functions called from class SaifBaseState
func _handle_input(_event: InputEvent) -> void: pass # Write Input logic here If State Transition by Input
func _state_process(_delta: float) -> void: pass # Write State logic here,that active state needs method _process()
func _state_physics_process(_delta: float) -> void: pass # Write State logic here,that active state needs method _physics_process()
func _state_transition(_delta: float) -> void: pass # Write Transition logic where state changes based on condition


## HELPER FUNCTIONS
func change_state(state: Node) -> void:
	state_machine.change_state(state)
