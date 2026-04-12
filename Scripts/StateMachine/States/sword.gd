#class_name Sword
extends SaifBaseState



func _state_transition() -> void: # Condition for State Change
	if state_master.movement_state_machine.active_state == null:
		change_state(state_machine.REST)
