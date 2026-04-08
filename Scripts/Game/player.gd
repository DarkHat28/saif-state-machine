extends CharacterBody2D


var speed = 300.0
var jump_velocity = -400.0

var direction: float = 0.0   # Will be updated each frame

func _input(_event: InputEvent) -> void:
	direction = Input.get_axis("left", "right") ## Update direction based on input
	

func _physics_process(_delta: float) -> void:
	
	if direction:
		$PlayerAnimation.flip_h = (direction < 0) # flip_h is true if moving left, else false if moving right
	## DO NOT call move_and_slide() here – let the state machine do it.
	## Movement and gravity are now handled by the active state

## Custom Methods which can be used in multiple state
func add_gravity(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
