extends CharacterBody2D


## Global Variables for States add below...
var direction: float = 0

func _input(_event: InputEvent) -> void:
	direction = Input.get_axis(&"left", &"right") ## Update direction based on input

## Custom Global Methods for states add below...
func add_gravity(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta

func flip() -> void:
	if direction:
		$PlayerAnimation.flip_h = (direction < 0) # flip_h is true if moving left, else false if moving right
