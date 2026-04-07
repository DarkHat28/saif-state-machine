@icon("res://Assets/Graphics/icons 16x16/arguments.png")
class_name SaifState
extends Node

#signal state_entered()
#signal state_exited()

@onready var state_machine: Node = get_parent()
@onready var actor: Node2D = state_machine.actor
@onready var player_animation: AnimatedSprite2D = %PlayerAnimation


func _input(_event: InputEvent) -> void:
	if state_machine.active_state == self:
		_handle_input()

func _handle_input() -> void:
	pass

func run_process(delta: float) -> void:
	_play_animation(delta)
	_state_logic(delta)

func run_physics_process(delta: float) -> void:
	_state_transition(delta)


func _play_animation(_delta: float) -> void:
	pass

func _state_logic(_delta: float) -> void:
	pass

func _state_transition(_delta: float) -> void:
	pass


func _enter_state() -> void:
	pass

func _exit_state() -> void:
	pass
