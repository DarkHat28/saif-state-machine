class_name SaifStateMachine
extends Node

#@export_category("State Master")
@export var actor: Node2D

#@export_category("State Machine")
@export var states: Array[Node] = []  # Drag child nodes here
@export var active_state: Node
@export var initial_state: Node
var previous_state: Node


func _ready() -> void:
	if states.size() == 0:
		states = get_children()
		if states.size() != null:
			if initial_state == null:
				active_state = initial_state
				previous_state = initial_state


func _process(delta: float) -> void:
	active_state.run_process(delta)

func _physics_process(delta: float) -> void:
	active_state.run_physics_process(delta)


func change_state(new_state: Node) -> void:
	if active_state:
		active_state.exit()
	previous_state = active_state
	active_state = new_state
	active_state.enter()
	print("Changed to: ", active_state.name)
