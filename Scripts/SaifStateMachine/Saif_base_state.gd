@icon("res://Assets/Graphics/icons 16x16/arguments.png")
class_name SaifBaseState
extends Node

#signal state_entered()
#signal state_exited()

@export var state_animation: StringName
@export var player_animation: Node


@onready var state_machine: Node = get_parent()
@onready var actor: Node2D = state_machine.actor

## Add Extra Node refrence here, based on requirements...
#@onready var player_animation: AnimatedSprite2D = %PlayerAnimation


# Input function for each State Class gets called from here
func _input(_event: InputEvent) -> void:
	if state_machine.active_state == self:
		_handle_input(_event)

func run_state_process(delta: float) -> void:
	_play_animation(delta)
	_state_process(delta)

func run_state_physics_process(delta: float) -> void:
	_state_physics_process(delta)
	_state_transition(delta)

func _play_animation(_delta: float) -> void: # Write Animation logic here
	player_animation.play(state_animation)
	print("Playing: ", state_animation)


## Below methods may Implement in Child Classes
# These functions called from class SaifBaseState
func _handle_input(_event: InputEvent) -> void: # Write Input logic here If State Transition by Input
	pass
func _state_process(_delta: float) -> void: # Write State logic here,that active state needs to _process()
	pass
func _state_physics_process(_delta: float) -> void: # Write State logic here,that active state needs to _physics_process()
	pass
func _state_transition(_delta: float) -> void: # Write Transition logic where state changes based on condition
	pass
# These functions called from class SaifStateMachine
func _enter_state() -> void:
	pass
func _exit_state() -> void:
	pass




##AI CODE
#@icon("res://Assets/Graphics/icons 16x16/arguments.png")
#class_name SaifBaseState
#extends Node
#
#@export var state_animation: StringName
#@export var player_animation: Node
#
#@onready var state_machine: Node = get_parent()
#@onready var actor: Node2D = state_machine.actor
#
#func _ready() -> void:
	## Error checking
	#if not state_machine:
		#push_error("State machine parent not found for state: ", name)
	#if not actor:
		#push_error("Actor not set in state machine for state: ", name)
	#if not player_animation:
		#push_warning("Player animation node not assigned in state: ", name)
#
#func _input(event: InputEvent) -> void:
	#if state_machine.active_state == self:
		#_handle_input(event)
#
#func run_state_process(delta: float) -> void:
	#_play_animation(delta)
	#_state_process(delta)
#
#func run_state_physics_process(delta: float) -> void:
	#_state_physics_process(delta)
	#_state_transition(delta)
#
#func _play_animation(_delta: float) -> void:
	#if player_animation and state_animation:
		#player_animation.play(state_animation)
	#else:
		#print("Animation skipped: player_animation or state_animation missing in ", name)
#
## Overridable methods
#func _handle_input(_event: InputEvent) -> void:
	#pass
#func _state_process(_delta: float) -> void:
	#pass
#func _state_physics_process(_delta: float) -> void:
	#pass
#func _state_transition(_delta: float) -> void:
	#pass
#func _enter_state() -> void:
	#pass
#func _exit_state() -> void:
	#pass
#
