extends RigidBody

export var thrust = 1200.0
export var top_speed = 10
var timer

func enemy_speed():
	return sqrt(pow(linear_velocity.z, 2) + pow(linear_velocity.x, 2))
	
func _time_out():
	pass
	
func _process(delta):
	
	$"enemy_01".rotation_degrees.y += 1
	

func _physics_process(delta):

	var speed = enemy_speed()
	
	if speed < top_speed:
		add_central_force($"rotation_target".transform.basis.z * -1 * thrust * delta)
