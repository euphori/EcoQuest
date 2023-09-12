extends Node3D

@onready var camera = $Camera3D
@onready var robot = $Robot
@onready var kid = $Kid
@export var camera_offset = 3


func _physics_process(delta):
	if kid.active:
		camera.global_position.x = kid.global_position.x
		camera.global_position.y = kid.global_position.y + camera_offset
	else:
		camera.global_position.x = robot.global_position.x
		camera.global_position.y = robot.global_position.y + camera_offset

func _input(event):
	if event.is_action_pressed("char_change"):
		if $Kid.active:
			$Robot.active = true
			$Kid.active = false
		else:
			$Kid.active = true
			$Robot.active = false

