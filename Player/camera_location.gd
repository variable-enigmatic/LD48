extends Position3D



var target
var t = 0
var shaking = false
export var lerp_speed = 3.0
var pos

func _ready():
#	randomize()
	Globals.register_camera(self)
	

	
func _physics_process(delta):
	
	if Globals.player_node:
		target = Globals.player_node.get_node("rotation/camera_target").global_transform.origin
		self.global_transform.origin = self.global_transform.origin.linear_interpolate(target, delta * lerp_speed)

	
