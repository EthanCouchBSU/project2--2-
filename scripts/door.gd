extends StaticBody2D



@onready var animTree = $AnimationTree
@onready var entrance  = $entrance
@onready var entered = $entered
var doorOpen = false

@export var target: StaticBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_entrance_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && body.hasKey():
		
		doorOpen = true
		animTree['parameters/conditions/open'] = true
		animTree['parameters/conditions/close'] = false
		
		
func _on_entrance_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		doorOpen = false
		animTree['parameters/conditions/open'] = false
		animTree['parameters/conditions/close'] = true


func _on_entered_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if doorOpen:
			body.useKey()
			body.global_position = target.position - Vector2(0,-200)
			get_tree().root.get_child(0).enteredDoor()
