extends Position3D




func _process(delta):
	
	self.look_at(Globals.player_node, Vector3(0,0,-1))
