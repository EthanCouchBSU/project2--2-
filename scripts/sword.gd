extends Area2D
@onready var animPlayer = $AnimationPlayer

var damage = 30


func addDamage():
	damage +=15
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("space"):
		swing()
		
	
func swing():
	animPlayer.play("swing")
	
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.hit(damage)
