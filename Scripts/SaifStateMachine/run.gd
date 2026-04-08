class_name Run
extends SaifBaseState


func _handle_input(_event: InputEvent) -> void: pass

func _state_process(_delta: float) -> void: pass # State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function

func _state_physics_process(_delta: float) -> void:
	# Apply horizontal movement
	actor.velocity.x = actor.direction * actor.speed
	
	#actor.add_gravity(delta)
	actor.move_and_slide()


func _state_transition(_delta: float) -> void: # Condition for State Change
	# Transition back to Idle when no direction is pressed
	if actor.direction == 0.0:
		state_machine.change_state(state_machine.IDLE)
	
	if not actor.is_on_floor():
		state_machine.change_state(state_machine.FALL)

func _enter_state() -> void: pass # Optionally set animation here (handled by base class if you set state_animation)

func _exit_state() -> void: pass
