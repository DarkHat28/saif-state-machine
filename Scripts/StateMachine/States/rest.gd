#class_name Rest
extends SaifBaseState


func _state_transition() -> void: # Condition for State Change
	if Input.is_action_just_pressed(&"attack"):
		match state_machine.current_weapon:
			state_machine.Weapon.SWORD:
				change_state(state_machine.SWORD)
			state_machine.Weapon.MAGIC:
				change_state(state_machine.MAGIC)
			#state_machine.Weapon.NONE:
				#change_state(state_machine.NONE)



func _enter_state() -> void:
	super()
	# You might break animations while changing states from multiple StateMachine states like in this case, but you can solve like this
	state_master.movement_state_machine.active_state._play_animation()
	print("NONE: state Entered!!!")
