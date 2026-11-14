extends CharacterBody2D

var character = ""
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_attacking := false

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("hit") and not is_attacking:
		is_attacking = true
		animated_sprite.play("smak")

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED * Global.speed_multiplier
		animated_sprite.flip_h = direction < 0
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not is_attacking:
		if not is_on_floor():
			animated_sprite.play("jump")
		elif direction != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idol")

	move_and_slide()

func _on_animation_finished() -> void:
	if animated_sprite.animation == "smak":
		is_attacking = false
