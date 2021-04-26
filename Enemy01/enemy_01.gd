extends RigidBody

onready var preload_projectile = preload("res://Enemy01/enemy_01_projectile.tscn")

onready var rot_node = get_node("rotation_target")

var projectile

export var velocity = -10

export var life = 100
export var thrust = 1200.0
export var top_speed = 10


func enemy_01_speed():
	return sqrt(pow(linear_velocity.z, 2) + pow(linear_velocity.x, 2))
	
func _process(delta):
	
	$"enemy_01".rotation_degrees.y += 1
	
	if life < 1:
		
		queue_free()

func _physics_process(delta):

	var speed = enemy_01_speed()
	
	if speed < top_speed:
		add_central_force($"rotation_target".transform.basis.z * -1 * thrust * delta)

func _on_enemy_01_body_entered(body):
	
	if body.is_in_group("projectiles"):
		life = life -50
		
		Globals.camera_shake = true

func _on_fire_shot_timer_timeout():
	
	projectile = preload_projectile.instance()
	get_node("/root").add_child(projectile)

	projectile.global_transform.origin = rot_node.global_transform.origin 
	projectile.rotation = rot_node.rotation

	projectile.apply_central_impulse(projectile.transform.basis.z * velocity)
	
