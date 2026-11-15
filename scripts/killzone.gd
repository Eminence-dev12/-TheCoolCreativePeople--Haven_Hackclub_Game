extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Prince" and body.name != "Mage":
		return
	print("you died")
	get_tree().reload_current_scene()
	print("random stuff happens now") # Replace with function body.
	#from here on is the effect randomiser
s
