extends RigidBody


var player_direction = -1

onready var player_rotation = get_node("rotation")
onready var player_roll_target = get_node("rotation/roll_target")
onready var camera_target = get_node("rotation/camera_target")

onready var wormhole_gravity = get_node("wormhole_gravity")

onready var energy_recharge_timer = get_node("energy_recharge_timer")

onready var preload_player_explosion = preload("res://Player/PlayerExplosion/player_explosion.gltf")
var player_explosion



func _ready():
	
	Globals.register_player(self)
	
func stop_player():
	
	linear_velocity = Vector3.ZERO
	
func player_speed():
	
	return sqrt(pow(linear_velocity.z, 2) + pow(linear_velocity.x, 2))

func _process(delta):
	
	
	if Input.is_action_pressed("ui_left"):
		player_roll_target.rotation_degrees.z = 60
		player_rotation.rotate_y(Globals.player_rot_speed)
		
	if Input.is_action_pressed("ui_right"):
		player_roll_target.rotation_degrees.z = -60
		player_rotation.rotate_y(-Globals.player_rot_speed)
		
	if Input.is_action_just_released("ui_left"):
		player_roll_target.rotation_degrees.z = 0
		
	if Input.is_action_just_released("ui_right"):
		player_roll_target.rotation_degrees.z = 0
		
func _physics_process(delta):
	
	var player_speed = player_speed()
	
	if Globals.wormhole_node:
		
		var wormhole_distance = self.global_transform.origin.distance_to(Globals.wormhole_node.global_transform.origin)
		wormhole_gravity.look_at(Globals.wormhole_node.global_transform.origin, Vector3(0,0,-1))
		add_central_force(wormhole_gravity.transform.basis.z * player_direction * (Globals.worm_hole_gravity_force/wormhole_distance) * delta)
		
	
	if Input.is_action_pressed("ui_up"):
		add_central_force(player_rotation.transform.basis.z * player_direction * Globals.player_thrust * delta)
		
	if Input.is_action_pressed("ui_down"):
		add_central_force(player_rotation.transform.basis.z * -player_direction * Globals.player_thrust * delta)
		
	camera_target.translation.z = -player_speed/4
	
	
	if Globals.player_energy < 0:
		
		if !Globals.game_over:
			Globals.game_over = true
			
			print("GAME OVER")
			
			player_explosion = preload_player_explosion.instance()
			get_node("/root").add_child(player_explosion)
			player_explosion.global_transform.origin = self.global_transform.origin
			player_explosion.get_node("AnimationPlayer").play("player_explosion")
			
			queue_free()
			

func _on_energy_recharge_timer_timeout():
	
	if Globals.player_energy < 100:
		
		Globals.player_energy += Globals.player_energy_recharge


func _on_player_body_entered(body):
	
	if body.is_in_group("enemy_01_projectiles"):
		
		Globals.player_energy -= 20
		
		Globals.camera_shake = true
		
		Globals.screen_red = true
		
		$"hit".play()
		
