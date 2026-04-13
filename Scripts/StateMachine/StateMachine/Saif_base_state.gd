@icon("res://Assets/Graphics/icons 16x16/arguments.png")
class_name SaifBaseState
extends Node


signal state_entered(state: SaifBaseState)
signal state_exited(state: SaifBaseState)
#signal one_shot_animation_finished(state: SaifBaseState)

@export var animation_player: Node
@export var state_animations: Array[StringName] = []


@onready var state_machine: StateMachine = get_parent() as StateMachine
@onready var state_master: StateMaster = state_machine.state_master as StateMaster
@onready var actor: Node = state_machine.actor

## Add Extra Node refrence here, based on requirements...
#@onready var player_animation: AnimatedSprite2D = %PlayerAnimation

func _ready() -> void:
	add_to_group("SAIF_STATE")
	if animation_player:
		animation_player.animation_finished.connect(_on_current_state_animation_finished)

	# Error checking
	if not (state_machine):
		push_error("State Machine Node not found for state: ", name.to_upper())
	if not (get_parent() as StateMachine):
		push_error("Parent Node is not 'State Machine Node' for state: ", name.to_upper())
	if not animation_player:
		push_warning("Animation Player Node not assigned on state: ", name.to_upper())
	if not state_animations:
		push_warning("Array state_animations not populated of State: ", name.to_upper())
	if state_animations == null:
		push_warning("Animation skipped: state_animations missing of State: ", name.to_upper())


## Input function for each State Class gets called from here
## Write State specific Input logic here
func _input(event: InputEvent) -> void:
	if state_machine.active_state == self:
		_handle_input(event)

func run_state_process(delta: float) -> void:
	_state_process(delta)

func run_state_physics_process(delta: float) -> void:
	_state_physics_process(delta)
	_state_transition()


func _play_animation() -> void: # Write Animation logic here
	if state_animations.size() == 0 and animation_player:
		push_warning("Animation skipped: animation_player or state_animations missing in ", name.to_upper())
	elif state_animations.size() == 1:
		## Logic for AnimatedSprite2D or AnimatedSprite3D Node
		if (animation_player is AnimatedSprite2D) or (animation_player is AnimatedSprite3D):
			#if animation_player.animation != state_animations[0]: # and animation_player.is_playing():
			if animation_player.sprite_frames.has_animation(state_animations[0]):
				animation_player.play(state_animations[0])
		## Logic for AnimationPlayer Node
		elif (animation_player is AnimationPlayer) and animation_player.has_animation():
			#if animation_player.current_animation != state_animations[0]: # and animation_player.is_playing():
			animation_player.play(state_animations[0])

# These functions called from class SaifStateMachine
func _enter_state() -> void:
	state_entered.emit(self)
	_play_animation()

func _exit_state() -> void:
	#if animation_player and animation_player.is_playing():
		#animation_player.stop()
	state_exited.emit(self)

func _on_current_state_animation_finished():
	print("Animation ended")

## Overridable methods : These functions called from class SaifBaseState
func _handle_input(_event: InputEvent) -> void: pass # Write Input logic here If State Transition by Input
func _state_process(_delta: float) -> void: pass # Write State logic here,that active state needs method _process()
func _state_physics_process(_delta: float) -> void: pass # Write State logic here,that active state needs method _physics_process()
func _state_transition() -> void: pass # Write Transition logic where state changes based on condition


## HELPER FUNCTIONS
func change_state(state: Node) -> void:
	state_machine.change_state(state)

func is_animation_finished(animation: StringName = &"attack") -> bool:
	if not animation_player:
		return false
	if animation_player is AnimatedSprite2D or animation_player is AnimatedSprite3D:
		return not animation_player.is_playing() and animation_player.animation == animation
	elif animation_player is AnimationPlayer:
		return not animation_player.is_playing() and animation_player.current_animation == animation
	return false
