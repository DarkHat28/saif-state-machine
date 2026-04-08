class_name Fall
extends SaifBaseState


func _handle_input(_event: InputEvent) -> void: pass

# These below functions get called from parent class "SaifBaseState"
func _state_process(_delta: float) -> void: pass # State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function

func _state_physics_process(delta: float) -> void:
	actor.velocity.x = move_toward(actor.velocity.x, 0.0, actor.speed / 100)
	
	actor.add_gravity(delta)
	actor.move_and_slide()

func _state_transition(_delta: float) -> void:
	if actor.is_on_floor():
		state_machine.change_state(state_machine.IDLE)


func _enter_state() -> void: pass

func _exit_state() -> void: pass
