extends CharacterBody2D

class_name playerChar
@export var Speed = 100
var curSpeed = 150 
var StaminaLoss = 2
var StaminaRegen = .5
var HealthRegen = .1
var keys = 0
@onready var animTree = $AnimationTree
@onready var staminaBar = $StaminaBar
@onready var healthBar = $HealthBar
@onready var audio = $AudioStreamPlayer
#keysfuncs-------------
func useKey():
	keys-=1
func getKey():
	keys+=1
func hasKey():
	if keys >= 1:
		return true
	else:
		return false
#stat buffs
func plusSpeed():
	Speed +=50
func plusStaRec():
	StaminaRegen +=.3
func plusHPRec():
	HealthRegen +=.1
func plusDamage():
	get_parent().addDamage()

func _ready():
	pass
	
	
func hit(damage):
	audio.play()
	healthBar.value -=  damage
	
	
func regenStamina():
	staminaBar.value +=StaminaRegen
	if staminaBar.value == 100:
		staminaBar.hide()
	

func _physics_process(delta: float) -> void:
	
	if healthBar.value < 1:
		get_tree().root.get_child(0).gameOver()
		
	
	var dir = Input.get_vector("left","right","up","down").normalized()
	self.velocity = dir*curSpeed
	
	if self.velocity.length() <0.1 :
		healthBar.value+=HealthRegen
	
	#running --------------
	
	if Input.is_action_pressed("shift"):
		if staminaBar.value > 0 && self.velocity.length() >0.1 :
			staminaBar.show()
			staminaBar.value -=StaminaLoss
			curSpeed = Speed *3
		elif staminaBar.value ==0:
			regenStamina()
			curSpeed = 0
		
	else:
		regenStamina()
		curSpeed = Speed
		
	#anims ---------------------------
	
	if self.velocity.length() >0.1:
		
		animTree['parameters/conditions/walk'] = true
		animTree['parameters/conditions/idle'] = false
	else:
		animTree['parameters/conditions/walk'] = false
		animTree['parameters/conditions/idle'] = true
	
	if dir != Vector2.ZERO:
		animTree['parameters/walk/blend_position'] = dir
		animTree['parameters/idle/blend_position'] = dir
	
	move_and_slide()
