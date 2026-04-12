#class_name Fall
extends SaifBaseState


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

func _state_transition() -> void:
	if actor.is_on_floor():
		change_state(state_machine.IDLE)
