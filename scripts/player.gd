extends Node2D
@onready var player = $playerChar
@onready var sword = $Sword

const radius = 90
func addDamage():
	sword.addDamage()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var swordPos = sword.position
	var mousePos = get_global_mouse_position()
	var playerPos = player.position
	
	
	sword.transform.origin = playerPos	
	
	
	sword.look_at(mousePos)
	
		
	
	
