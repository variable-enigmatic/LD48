extends RigidBody


export var life = 100
export var thrust = 1200.0
export var top_speed = 10
var timer

func enemy_01_speed():
	return sqrt(pow(linear_velocity.z, 2) + pow(linear_velocity.x, 2))
	
func _process(delta):
	
	$"enemy_01".rotation_degrees.y += 1
	
	if life < 1:
		
	#	print("Kill")
		queue_free()

func _physics_process(delta):

	var speed = enemy_01_speed()
	
	if speed < top_speed:
		add_central_force($"rotation_target".transform.basis.z * -1 * thrust * delta)

func _on_enemy_01_body_entered(body):
	
	if body.is_in_group("projectiles"):
		life = life -30

