@icon("res://Assets/Graphics/icons 16x16/voxel_outlines.png")
class_name StateMaster
extends Node


@export var movement_state_machine: MovementStateMachine
@export var attack_state_machine: AttackStateMachine

## State Debugger
@export var state_debugger: bool = true
@onready var state_debugger_label: Label = %StateDebuggerLabel


func _ready() -> void:
	## Wait for the Acotr or State Machine added to the scene tree by instancing.
	await get_tree().process_frame
	_connect_all_state_signals()
	
	## State Debug
	if not (state_debugger_label and state_debugger):
		state_debugger_label.hide()


func _connect_all_state_signals() -> void:
	var states = get_tree().get_nodes_in_group("SAIF_STATE") # Get all nodes in group "SAIF_STATE"
	if not states:
		push_error('State Signals not connected to function "_on_state_entered" or "_on_state_exited"')
		return
	for each_state in states:
		# Connect Signal: "state_entered"
		if each_state.has_signal("state_entered"):
			each_state.state_entered.connect(_on_state_entered)
		else:
			push_warning('"state_entered" Signal is not connected of State: ', each_state.name.to_upper())
		# Connect Signal: "state_exited"
		if each_state.has_signal("state_exited"):
			each_state.state_exited.connect(_on_state_exited)
		else:
			push_warning('"state_exited" Signal is not connected of State: ', each_state.name.to_upper())

func _on_state_entered(state: SaifBaseState) -> void:
	print("\n------------------------------\n", "STATE ENTERED: ", state.name.to_upper())

func _on_state_exited(state: SaifBaseState) -> void:
	print("STATE EXITED: ", state.name.to_upper(), "\n------------------------------\n")



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
