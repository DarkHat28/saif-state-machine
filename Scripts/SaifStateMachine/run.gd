class_name Run
extends SaifBaseState


# Write Input logic here If State Transition by Input
func _handle_input(_event: InputEvent) -> void:
	# Transition back to Idle when no direction is pressed
	if actor.direction == 0.0:
		print("Run -> Idle (input handled)")
		state_machine.change_state(state_machine.IDLE)

# These below functions get called from parent class "SaifBaseState"
func _state_process(_delta: float) -> void: # State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function
	pass

func _state_physics_process(delta: float) -> void:
	# Apply horizontal movement
	actor.velocity.x = actor.direction * actor.speed
	
	# Debug output
	if actor.direction != 0.0:
		print("Run: velocity.x = ", actor.velocity.x)
	
	actor.add_gravity(delta)
	actor.move_and_slide()


func _state_transition(_delta: float) -> void: # Condition for State Change
	pass


# These below functions get called from parent Node "SaifStateMachine"
func _enter_state() -> void:
	print("Entered Run state")
	# Optionally set animation here (handled by base class if you set state_animation)

func _exit_state() -> void:
	print("Exited Run state")
