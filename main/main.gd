extends Node2D

@onready var best_score_label: Label = %BestScoreLabel
@onready var buttons = [%NewGameButton, %QuitButton]

var current_button_index = 0




func handle_input():
	if Input.is_action_just_pressed("ui_up"):
		move_focus(-1)
	elif Input.is_action_just_pressed("ui_down"):
		move_focus(1)
	elif Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("ui_select"):
		buttons[current_button_index].emit_signal("pressed")

func move_focus(direction: int) -> void:
	buttons[current_button_index].release_focus()

	current_button_index = (current_button_index + direction + buttons.size()) % buttons.size()
	buttons[current_button_index].grab_focus()


func _on_quit_button_pressed() -> void:
	get_tree().quit()




func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://senecs/HELP.tscn")
	pass # Replace with function body.
