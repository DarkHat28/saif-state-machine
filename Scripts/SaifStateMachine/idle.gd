class_name Idle
extends SaifState


# State Transition by Input
func _input(_event: InputEvent) -> void:
	pass

# State Animation
func _play_animation(_delta: float) -> void:
	player_animation.play(&"idle")

# State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function.
func _state_logic(_delta: float) -> void:
	actor.velocity.x = 0.0

# Condition for State Change
func _state_transition(_delta: float) -> void:
	pass


func run_process(delta: float) -> void:
	_play_animation(delta)
	_state_logic(delta)

func run_physics_process(delta: float) -> void:
	_state_transition(delta)

func _enter_state() -> void:
	pass
	
func _exit_state() -> void:
	pass
