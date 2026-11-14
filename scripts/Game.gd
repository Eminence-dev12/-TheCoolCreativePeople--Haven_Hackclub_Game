extends Node2D

@onready var player_spawn: Marker2D = $PlayerSpawn

const PRINCE_SCENE := preload("res://scenes/prince.tscn")
const MAGE_SCENE := preload("res://scenes/mage.tscn")

func _ready() -> void:
	var player: CharacterBody2D
	if Global.selected_character == 2:
		player = MAGE_SCENE.instantiate()
	else:
		player = PRINCE_SCENE.instantiate()
	add_child(player)
	player.global_position = player_spawn.global_position
