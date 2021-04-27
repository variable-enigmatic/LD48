extends RigidBody

onready var preload_projectile = preload("res://Enemy01/enemy_01_projectile.tscn")

onready var preload_explosion = preload("res://Enemy01/enemy_explosion.gltf")

var enemy_explosion

onready var rot_node = get_node("rotation_target")

var projectile

var dead = false

export var velocity = -10

export var life = 100
export var thrust = 1200.0
export var top_speed = 10

var die_timer

var death_played = false

func enemy_01_speed():
	return sqrt(pow(linear_velocity.z, 2) + pow(linear_velocity.x, 2))
	
func _process(delta):
	
	$"enemy_01".rotation_degrees.y += 1
	
	if life < 1:
		
		if !death_played:
			death_played = true
			$"enemy_dead".play()
		
		if !dead:
			dead = true
			enemy_explosion = preload_explosion.instance()
			add_child(enemy_explosion)
			enemy_explosion.global_transform.origin = self.global_transform.origin
			enemy_explosion.get_node("AnimationPlayer").play("enemy_explosion")

func _physics_process(delta):

	var speed = enemy_01_speed()
	
	if speed < top_speed:
		add_central_force($"rotation_target".transform.basis.z * -1 * thrust * delta)

func _on_enemy_01_body_entered(body):
	
	if body.is_in_group("projectiles"):
		life = life -50
		
		Globals.camera_shake = true
		$"enemy_hit".play()

func _on_fire_shot_timer_timeout():
	
	projectile = preload_projectile.instance()
	get_node("/root").add_child(projectile)

	projectile.global_transform.origin = rot_node.global_transform.origin 
	projectile.rotation = rot_node.rotation

	projectile.apply_central_impulse(projectile.transform.basis.z * velocity)
	
	$"enemy_fire".play()
	

func _on_enemy_dead_finished():
	queue_free()
