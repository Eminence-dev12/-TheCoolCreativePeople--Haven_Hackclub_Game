extends CharacterBody2D

const SPEED = 500.0

var direction = 1
func _physics_process(delta):
	velocity.x = SPEED * direction
	move_and_slide()
