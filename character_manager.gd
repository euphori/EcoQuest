extends Node3D

@onready var robot_camera = $Robot/Camera3D
@onready var kid_camera = $Kid/Camera3D
@onready var robot = $Robot
@onready var kid = $Kid

func _input(event):
	if event.is_action_pressed("char_change"):
		if $Kid.active:
			$Robot.active = true
			$Kid.active = false
			robot_camera.current = true
			
		else:
			$Kid.active = true
			$Robot.active = false
			kid_camera.current = true
