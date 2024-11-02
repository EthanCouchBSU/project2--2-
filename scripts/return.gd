extends Control

@onready var backColor = $back/backBox



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/intro_screen.tscn")


func _on_back_mouse_entered() -> void:
	backColor.color = Color(0.2,0.2,0.2)


func _on_back_mouse_exited() -> void:
	backColor.color = Color(0,0,0)
