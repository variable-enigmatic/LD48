extends Position3D

var target
var t = 0

export var lerp_speed = 3.0

func _physics_process(delta):
	
	
	if Globals.player_node:
		
#		t += delta * 0.001
		
		target = Globals.player_node.get_node("rotation/camera_target").global_transform.origin
		
		self.global_transform.origin = self.global_transform.origin.linear_interpolate(target, delta * lerp_speed)
