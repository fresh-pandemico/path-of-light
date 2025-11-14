extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://senecs/main_mune.tscn")
	pass # Replace with function body.


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://senecs/world.tscn")
	pass # Replace with function body.
