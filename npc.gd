extends CharacterBody3D


@export var path_to_player: NodePath
@onready var player = get_node(path_to_player)

func _ready():
	$AnimationPlayer.play("idle")

func _physics_process(delta):
	if global_position.direction_to(player.global_position).x < 0:
		$Sprite3D.flip_h = true
	else:
		$Sprite3D.flip_h = false

func _on_interact_ui_talk():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue_sample.dialogue"),"start")
	return
