extends Button
@onready var backColor = $backBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().root.get_child(0).mainSwitch()


func _on_mouse_entered() -> void:
	backColor.color = Color(.3,0,0)


func _on_mouse_exited() -> void:
	backColor.color = Color(0,0,0)
