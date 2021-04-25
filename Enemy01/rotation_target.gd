extends Position3D

func _physics_process(delta):

	self.look_at(Globals.player_node.global_transform.origin, Vector3(0,1,0))

	#print(str(Globals.player_node.global_transform.origin))
