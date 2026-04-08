class_name Idle
extends SaifBaseState


# Write State specific Input logic here
func _handle_input(_event: InputEvent) -> void: pass

# These below functions get called from parent class "SaifBaseState"
func _state_process(_delta: float) -> void: pass # State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function

func _state_physics_process(_delta: float) -> void:
	# Decelerate to a stop
	actor.velocity.x = move_toward(actor.velocity.x, 0.0, actor.speed)
	#actor.add_gravity(delta)
	actor.move_and_slide()

func _state_transition(_delta: float) -> void: # Condition for State Change
	if not actor.is_on_floor():
		state_machine.change_state(state_machine.FALL)
	if actor.direction != 0.0:
		state_machine.change_state(state_machine.RUN)
	if Input.is_action_just_pressed(&"jump"):
		state_machine.change_state(state_machine.JUMP)


# This function gets called when Actor Enters State
func _enter_state() -> void: pass

# This function gets called when Actor Exits State
func _exit_state() -> void: pass
