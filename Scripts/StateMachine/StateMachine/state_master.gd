@icon("res://Assets/Graphics/icons 16x16/voxel_outlines.png")
class_name StateMaster
extends Node


@export var movement_state_machine: MovementStateMachine
@export var attack_state_machine: AttackStateMachine

## State Debugger
@export var state_debugger: bool = true
@onready var state_debugger_label: Label = %StateDebuggerLabel


func _ready() -> void:
	## State Debug
	if not (state_debugger_label and state_debugger):
		state_debugger_label.hide()

func _process(_delta: float) -> void:
	if state_debugger and state_debugger_label.visible:
		_state_debug()


func _state_debug() -> void:
	var fps = Performance.get_monitor(Performance.TIME_FPS)
	var phys_ms = Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS) * 1000
	state_debugger_label.text = "FPS: " + str(fps) + " (" + str(snapped(phys_ms, 0.01)) + "ms)" + \
		"\nMovement State -> " + movement_state_machine.active_state.name.to_upper() + \
		"\nAttack state -> " + attack_state_machine.active_state.name.to_upper()
	#print("\nMovement State -> " + movement_state_machine.active_state.name.to_upper() + \
		#"\nAttack state -> " + attack_state_machine.active_state.name.to_upper()
		#)
