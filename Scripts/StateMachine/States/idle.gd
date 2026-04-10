#class_name Idle
extends SaifBaseState

@export var deceleration: float = 80.0


func _state_physics_process(_delta: float) -> void:
	actor.velocity.x = move_toward(actor.velocity.x, 0.0, deceleration) # Decelerate to a stop
	actor.move_and_slide()

func _state_transition(_delta: float) -> void: # Condition for State Change
	if Input.is_action_just_pressed(&"jump"): change_state(state_machine.JUMP)
	elif not actor.is_on_floor(): change_state(state_machine.FALL)
	elif actor.direction != 0.0: change_state(state_machine.RUN)
