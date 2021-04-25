extends Spatial

var current_wormhole

#func _ready():
#	Globals.register_wormhole(self)

func _on_wormhole_tree_entered():
	current_wormhole = true
	
#func _on_wormhole_tree_exited():
#	current_wormhole = false




func _process(delta):

	rotate_y(0.3)

	if current_wormhole:
		pass

