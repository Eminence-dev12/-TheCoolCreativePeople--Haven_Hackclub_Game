extends Node2D

@onready var player_spawn: Marker2D = $PlayerSpawn

const PRINCE_SCENE := preload("res://scenes/prince.tscn")
const MAGE_SCENE := preload("res://scenes/mage.tscn")
const SHEILDMAN_SCENE := preload("res://scenes/sheildman.tscn")
const HLEBERD_SCENE := preload("res://scenes/halberdier.tscn")
func _ready() -> void:
	var player: CharacterBody2D
	if Global.selected_character == 2:
		player = MAGE_SCENE.instantiate()
	elif Global.selected_character == 3:
		player = SHEILDMAN_SCENE.instantiate()
	elif Global.selected_character == 4:
		player = HLEBERD_SCENE.instantiate()
	else:
		player = PRINCE_SCENE.instantiate()
	add_child(player)
	player.global_position = player_spawn.global_position
