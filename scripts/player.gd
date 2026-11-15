extends CharacterBody2D

var character = ""
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
const FIREBALL_SCENE = preload("res://scenes/fireball.tscn")



var is_attacking := false

func launch_fireball():
	var fireball = FIREBALL_SCENE.instantiate()

	get_parent().add_child(fireball)

	fireball.global_position = global_position + Vector2(
		-30 if animated_sprite.flip_h else 30,
		0)

	fireball.direction = -1 if animated_sprite.flip_h else 1


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
		if Global.selected_character == 2:
			await get_tree().create_timer(0.8).timeout
			launch_fireball()


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
		
