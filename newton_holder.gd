extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1000.0
@onready var edge: Area2D = $"../Load/Edge"
@onready var edge_2: Area2D = $"../Load/Edge2"
@onready var edge_3: Area2D = $"../Load/Edge3"
@onready var edge_4: Area2D = $"../Load/Edge4"



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		print(position-edge.position)
		print(position-edge_2.position)
		print(position-edge_3.position)
		print(position-edge_4.position)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
