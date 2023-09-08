extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/AnimationPlayer.play("load")

func _input(event):
	if event.is_action_pressed("interact"):
		get_tree().change_scene_to_file("res://menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
