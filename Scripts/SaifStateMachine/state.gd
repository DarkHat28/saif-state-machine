# state.gd
class_name State
extends Node

#signal state_entered()
#signal state_exited()

@onready var state_machine: Node = get_parent()
@onready var actor: Node2D = state_machine.actor
@onready var player_animation: AnimatedSprite2D = %PlayerAnimation


func _ready() -> void:
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


func _on_state_entered() -> void:
	pass

func _on_state_exited() -> void:
	pass
