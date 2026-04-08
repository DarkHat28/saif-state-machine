extends CharacterBody2D


var speed = 300.0
var jump_velocity = -400.0

var direction: float = 0.0   # Will be updated each frame

func _physics_process(delta: float) -> void:
	## Update direction based on input
	direction = Input.get_axis("left", "right")
	print(direction)
	
	# Debug: print direction when it changes (optional)
	if direction != 0.0:
		print("Player direction: ", direction)
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = jump_velocity
	
	## Get the input direction and handle the movement/deceleration.
	#if direction:
		#velocity.x = direction * speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
	#move_and_slide()
	## Movement and gravity are now handled by the active state
	## DO NOT call move_and_slide() here – let the state machine do it.

## Custom Methods
func add_gravity(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
