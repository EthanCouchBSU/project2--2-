extends Control
@onready var playColor = $MarginContainer/VBoxContainer/Play/playBox
@onready var exitColor = $MarginContainer/VBoxContainer/Exit/exitBox
@onready var creditColor = $MarginContainer/VBoxContainer/credits/creditBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/base_level.tscn")


func _on_play_mouse_entered() -> void:
	
	playColor.color  = Color(.3,0,0)


func _on_play_mouse_exited() -> void:
	playColor.color  = Color(0,0,0)


func _on_credits_pressed() -> void:
	get_tree().root.get_child(0).creditSwitch()


func _on_credits_mouse_entered() -> void:
	creditColor.color  = Color(.3,0,0)


func _on_credits_mouse_exited() -> void:
	creditColor.color  = Color(0,0,0)


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_exit_mouse_entered() -> void:
	exitColor.color  = Color(.3,0,0)


func _on_exit_mouse_exited() -> void:
	exitColor.color  = Color(0,0,0)
