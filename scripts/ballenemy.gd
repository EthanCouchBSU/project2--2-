extends CharacterBody2D
const speed = 100
var attacking 
var damage = .5

@onready var audio = $AudioStreamPlayer

@onready var healthbar = $HealthBar
@onready var animTree = $AnimationTree

@onready var player = get_tree().get_nodes_in_group("player")[0].get_node("playerChar")



func hit(damage):
	audio.play()
	healthbar.value -= damage
	


func _physics_process(delta: float) -> void:
	
	if(attacking):
		player.hit(damage)
		await get_tree().create_timer(1.0).timeout
	if healthbar.value <= 0:
		queue_free()
	player = get_tree().get_nodes_in_group("player")[0].get_node("playerChar")
	# run away if lower than half health
	if healthbar.value > healthbar.max_value/2:
		velocity = position.direction_to(player.global_position) *speed
	else:
		velocity = (position.direction_to(player.global_position) *(speed*1.5))*-1
		
		
	#anims---------
	animTree['parameters/movement/blend_position'] = velocity
	
	move_and_collide(velocity*delta)
	
	



func _on_hitbox_body_exited(body: Node2D) -> void:
	
	if body.is_in_group("player"):
		
		player = body
		attacking = false
		animTree['parameters/conditions/attack'] = false


func _on_hitbox_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("player"):
		attacking = true
		animTree['parameters/conditions/attack'] = true
		
			
