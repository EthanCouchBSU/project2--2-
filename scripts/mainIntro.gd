extends Control
var creditSceneRes = preload("res://scenes/credits.tscn")
var mainSceneRes = preload("res://scenes/main_intro.tscn")
var mainScene
var creditScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	mainScene = mainSceneRes.instantiate()
	get_tree().root.get_child(0).add_child(mainScene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func creditSwitch():
	mainScene.queue_free()
	creditScene = creditSceneRes.instantiate()
	get_tree().root.get_child(0).add_child(creditScene)
func mainSwitch():
	creditScene.queue_free()
	mainScene = mainSceneRes.instantiate()
	get_tree().root.get_child(0).add_child(mainScene)
	
