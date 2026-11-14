extends CharacterBody2D

const SPEED: float = 400.0
const MAX_RANGE: float = 1200.0

var direction: Vector2 = Vector2.ZERO
var travelled: float = 0.0

func shoot(target: Vector2) -> void:
	direction = (target - global_position).normalized()
	rotation = direction.angle()

func _physics_process(delta: float) -> void:
	if direction == Vector2.ZERO:
		return
	var step := direction * SPEED * delta
	global_position += step
	travelled += step.length()
	if travelled >= MAX_RANGE:
		queue_free()
