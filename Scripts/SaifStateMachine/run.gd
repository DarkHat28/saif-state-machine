class_name Run
extends SaifBaseState


@export var speed: float = 300.0
@export var acceleration: float = 150.0


func _state_physics_process(_delta: float) -> void:
	actor.flip()
	actor.velocity.x = move_toward(actor.velocity.x, actor.direction * speed, acceleration) # Applys horizontal movement
	actor.move_and_slide()

func _state_transition(_delta: float) -> void: # Condition for State Change
	# Transition back to Idle when no direction is pressed
	if actor.direction == 0.0: change_state(state_machine.IDLE)
	elif not actor.is_on_floor(): change_state(state_machine.FALL)
	elif Input.is_action_just_pressed(&"jump"): change_state(state_machine.JUMP)
