extends Control

@onready var start = $CanvasLayer/Start
@onready var options = $CanvasLayer/Options
@onready var quit = $CanvasLayer/Quit
@export var path_to_player : NodePath

@onready var player = get_node(path_to_player)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	player.camera.current = true
	self.queue_free()
