extends Control

@onready var start = $CanvasLayer/Start
@onready var options = $CanvasLayer/Options
@onready var quit = $CanvasLayer/Quit
@export var path_to_player : NodePath
@export var path_to_camera : NodePath


@onready var player = get_node(path_to_player)
@onready var menu_camera = get_node(path_to_camera)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action("escape"):
		self.visible = true


func _on_start_pressed():
	menu_camera.queue_free()
	self.visible = false


func _on_quit_pressed():
	get_tree().quit()
