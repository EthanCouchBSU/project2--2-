extends CharacterBody2D
var speed = 170
var attacking 
var damage = 2

@onready var audio = $AudioStreamPlayer

@onready var healthBar = $HealthBar
@onready var animTree = $AnimationTree

enum{attack, retreat, follow}
var d = 0
var state = attack
@onready var player = get_tree().get_nodes_in_group("player")[0].get_node("playerChar")


func hit(damage):
	audio.play()
	healthBar.value -= damage*.5
	



func _physics_process(delta: float) -> void:
	
	if attacking:
		player.hit(damage)
		await get_tree().create_timer(1.0).timeout
	if healthBar.value <= 0:
		queue_free()
		
	player = get_tree().get_nodes_in_group("player")[0].get_node("playerChar")
	
	match state:
		attack:
			move(position.direction_to(player.global_position),delta,speed*2)
			await get_tree().create_timer(1.0).timeout
			state=retreat
		retreat:
			move((position.direction_to(player.global_position))*-1,delta,speed)
			await get_tree().create_timer(2.0).timeout
			state=attack
		
	
	
func circle(targetLoc,radius):
	var angle =  3 *PI *2
	var x = targetLoc.x +cos(angle) *radius
	var y = targetLoc.y +sin(angle) * radius

	return Vector2(x,y)
	
	
func move(targetLoc, delta,curSpeed):
	var direction = targetLoc.normalized()
	animTree['parameters/movement/blend_position'] = velocity
	velocity =  direction *curSpeed
	move_and_collide(velocity*delta)
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("player"):
		animTree['parameters/conditions/attack'] = true
		attacking = true
			


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		animTree['parameters/conditions/attack'] = false
		attacking = false
	
