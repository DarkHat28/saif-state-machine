#class_name Jump
extends SaifBaseState


@export var _jump_velocity: float = -350.0
@export var air_speed_modifier: float = 0.5

@onready var idle: SaifBaseState = %Idle
@onready var run: SaifBaseState = %Run


@onready var air_acceleration: float = air_speed_modifier * run.acceleration # Caching Calculation here for performance and reduce redundant calculations
@onready var air_deceleration: float = air_speed_modifier * idle.deceleration # Caching Calculation here for performance and reduce redundant calculations


func _state_physics_process(delta: float) -> void:
	if actor.direction:
		actor.velocity.x = move_toward(actor.velocity.x, actor.direction * run.speed, air_acceleration) # Applys horizontal movement
	else:
		actor.velocity.x = move_toward(actor.velocity.x, actor.direction * run.speed, air_deceleration) # Applys horizontal movement
	
	actor.flip()
	actor.add_gravity(delta)
	actor.move_and_slide()

func _state_transition() -> void: # Condition for State Change
	if actor.velocity.y >= 0.0: change_state(state_machine.FALL)

# These below functions get called from parent Node "SaifStateMachine"
func _enter_state() -> void:
	super()
	actor.velocity.y = _jump_velocity
