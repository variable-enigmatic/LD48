extends Spatial

func _ready():
	pass
	
func _physics_process(delta):
	
	Globals.player_node.queue_free()
