extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


@export var default_char = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var can_move = true
var jumping = false
var busy = false
var active
var pushing = false


func _ready():
	if default_char:
		active = true


func jump():
	velocity.y = JUMP_VELOCITY


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta


	if Input.is_action_just_pressed("jump") and is_on_floor() and !busy and active:
		jumping = true
		$AnimationPlayer.play("jump")
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play("falling")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction.x and active:
		if is_on_floor():
			jumping = false
		velocity.x = direction.x * SPEED
		if !jumping and !busy:
			$AnimationPlayer.play("run")
		if velocity.x  < 0 and !busy :
			$Sprite3D.flip_h = true
		elif velocity.x  > 0 and !busy :
			$Sprite3D.flip_h = false
	else:
		
		if !jumping and !busy:
			$AnimationPlayer.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	if can_move:
		move_and_slide()

