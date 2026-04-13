#class_name Magic
extends SaifBaseState


# Uncomment this function when you add animation
func _state_transition() -> void: # Condition for State Change
	if Input.is_action_just_pressed(&"attack"):
		match state_machine.current_weapon:
			state_machine.Weapon.SWORD:
				change_state(state_machine.SWORD)
			state_machine.Weapon.MAGIC:
				change_state(state_machine.MAGIC)
			state_machine.Weapon.NONE:
				change_state(state_machine.NONE)

func _enter_state() -> void:
	super()
	instatiate_magic()


func instatiate_magic() -> void:
	print("Fire Ball!!!     >>>--------->\n")
	#change_state(state_machine.NONE)
