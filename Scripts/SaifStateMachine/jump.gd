class_name Jump
extends SaifBaseState


# Write Input logic here If State Transition by Input
func _handle_input(_event: InputEvent) -> void:
	pass

# These below functions get called from parent class "SaifBaseState"
func _state_process(_delta: float) -> void: # State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function
	pass

func _state_physics_process(_delta: float) -> void:
	pass

func _state_transition(_delta: float) -> void: # Condition for State Change
	pass


# These below functions get called from parent Node "SaifStateMachine"
func _enter_state() -> void:
	pass

func _exit_state() -> void:
	pass
