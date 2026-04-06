@tool
class_name Door
extends Area2D


@onready var door_animation: AnimatedSprite2D = $DoorAnimation
@onready var door_collision: CollisionShape2D = $DoorCollision

@export var enter_door: bool = true

var can_enter: bool = true
var can_exit: bool = true

func _ready() -> void:
	door_idle()

func _on_body_entered(body: Node2D) -> void:
	## ENTER DOOR LOGIC
	if enter_door and can_enter:
		if body.is_in_group("PLAYER"):
			open_door()
			can_enter = false
			print(body.name, " Entered")
	
	## EXIT DOOR LOGIC
	if not enter_door and can_exit:
		if body.is_in_group("PLAYER"):
			open_door()
			await get_tree().create_timer(2).timeout
			close_door()
			can_exit = false
			print(body.name, " Exited")


func door_idle() -> void:
	door_animation.play(&"door_idle")

func open_door() -> void:
	door_animation.play(&"door_open")

func close_door() -> void:
	door_animation.play(&"door_close")
