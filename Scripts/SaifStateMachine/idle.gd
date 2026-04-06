class_name Idle
extends State


func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass


# State Transition by Input
func _input(_event: InputEvent) -> void:
	pass


func _on_state_entered() -> void:
	pass
	
func _on_state_exited() -> void:
	pass

# State Animation
func _play_animation() -> void:
	player_animation.play(&"idle")

# State Logic Code like Particles, Sound, Progress bar or any other UI update etc in process function.
func _state_logic() -> void:
	actor.velocity.x = 0.0

# Condition for State Change
func _state_transition() -> void:
	pass
