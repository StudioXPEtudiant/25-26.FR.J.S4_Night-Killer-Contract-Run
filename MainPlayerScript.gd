extends RigidBody2D

@export var moveSpeed: float = 300
@export var jumpForce: float = 450



func _physics_process(delta):
	var horizontalAxe = Input.get_axis("P.M_LEFT", "P.M_RIGHT")
	linear_velocity = Vector2(horizontalAxe * moveSpeed, linear_velocity.y)
	if Input.is_action_just_pressed('P_JUMP'):
		linear_velocity.y = -jumpForce
