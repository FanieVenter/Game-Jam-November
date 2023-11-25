extends CharacterBody2D
var boots

const SPEED = 300.0
const JUMP_VELOCITY = -200

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 600

func on_area_body_entered(body):
	if body.is_in_group("boots"):
		boots = true
		print("entered")

func _physics_process(delta):
	if boots == true:
		$PlayerWBoots.visible = true
		$Player.visible = false
		gravity = 500
	else:
		$PlayerWBoots.visible = false
		$Player.visible = true
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
