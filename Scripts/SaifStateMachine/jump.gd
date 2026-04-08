class_name Jump
extends SaifBaseState


func _handle_input(_event: InputEvent) -> void: pass

# These below functions get called from parent class "SaifBaseState"
func _state_process(_delta: float) -> void: pass # State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function

func _state_physics_process(_delta: float) -> void:
	#if Input.is_action_just_pressed("jump") and actor.is_on_floor():
		#actor.velocity.y = actor.jump_velocity
	pass

func _state_transition(_delta: float) -> void: # Condition for State Change
	if actor.is_on_floor(): #  actor.direction == 0.0
		state_machine.change_state(state_machine.IDLE)

# These below functions get called from parent Node "SaifStateMachine"
func _enter_state() -> void:
	actor.velocity.y = actor.jump_velocity

func _exit_state() -> void: pass
