extends Node2D

var lvlList = [preload("res://scenes/level1.tscn"),preload("res://scenes/level_2.tscn"),preload("res://scenes/level_3.tscn")]
var keyResource = preload("res://scenes/key.tscn")
var itemsList = [preload("res://scenes/damage_buff.tscn"),preload("res://scenes/speed_buff.tscn"), preload("res://scenes/health_buff.tscn"), preload("res://scenes/stamina_buff.tscn")]
var rng = RandomNumberGenerator.new()
var key
var item
var level
var change = false


func gameOver():
	get_tree().change_scene_to_file("res://gameOver.tscn")

func enteredDoor():
	change = true
	
func clearLevel():
	level.queue_free()
func clearShop():
	if key != null:
		key.queue_free()
	if item != null:
		item.queue_free()

func loadLevel():
	level = lvlList[rng.randf_range(0,lvlList.size())].instantiate()
	get_tree().get_nodes_in_group("levels")[0].add_child(level)
func loadShop():
	key = keyResource.instantiate()
	item = itemsList[rng.randf_range(0,itemsList.size())].instantiate()
	
	get_tree().root.get_child(0).add_child(key)
	get_tree().root.get_child(0).add_child(item)
	key.position = Vector2(5537,888)
	item.position = Vector2(5400,1200)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		loadLevel()

func _on_level_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		clearLevel()


func _on_shop_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		loadShop()


func _on_shop_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		clearShop()
	
		
