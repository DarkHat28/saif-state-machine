class_name AttackStateMachine
extends StateMachine



## References to all states
@export var NONE: SaifBaseState
@export var SWORD: SaifBaseState
@export var MAGIC: SaifBaseState



@export_category("Weapon")
enum Weapon { NONE, SWORD, MAGIC }
@export var current_weapon: Weapon = Weapon.NONE

@onready var movement_state_machine: MovementStateMachine = $"../MovementStateMachine"


func _ready() -> void:
	super._ready()
	print("==============================\nStarting weapon: ", Weapon.keys()[current_weapon], "\n==============================\n")

func _input(event: InputEvent) -> void:
	## This is how you can cross check between two state machines active states and put your logic
	if movement_state_machine.active_state in [movement_state_machine.JUMP, movement_state_machine.FALL]:
		print("Weapon cannot be changed while Airborne")
		return
	# Keyboard button (or any bound action) – cycle forward
	if Input.is_action_just_pressed("change_weapon"):
		cycle_weapon_forward()
	
	# Mouse wheel
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			cycle_weapon_forward()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			cycle_weapon_backward()

func cycle_weapon_forward() -> void:
	current_weapon = (current_weapon + 1) % Weapon.size() as Weapon
	on_weapon_changed()

func cycle_weapon_backward() -> void:
	# Add Weapon.size() to avoid negative modulo
	current_weapon = (current_weapon - 1 + Weapon.size()) % Weapon.size() as Weapon
	on_weapon_changed()

func on_weapon_changed() -> void:
	print("\n==============================\nWeapon changed to: ", Weapon.keys()[current_weapon], "\n==============================\n")
	# You may add visual effects, sound, or change attack behavior here
