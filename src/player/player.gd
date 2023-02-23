extends CharacterBody2D


@export var speed = 100
@export var friction = 1.00
@export var acceleration = 0.1


func get_input():
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")


func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
