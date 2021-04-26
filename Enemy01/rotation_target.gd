extends Position3D

func _physics_process(delta):


	if Globals.player_node:
		self.look_at(Globals.player_node.global_transform.origin, Vector3(0,0,-1))


