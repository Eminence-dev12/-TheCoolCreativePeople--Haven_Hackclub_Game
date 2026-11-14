extends Area2D
@export var player_1: Node
@export var player_2: Node

func _on_body_entered(body: Node2D) -> void:
	print("you died")
	get_tree().reload_current_scene()
	print("random stuff happens now") # Replace with function body.
	#from here on is the effect randomiser
	
