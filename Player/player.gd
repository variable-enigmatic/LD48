extends RigidBody


var player_direction = -1

onready var player_rotation = get_node("rotation")
onready var player_roll_target = get_node("rotation/roll_target")

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
	
	if Input.is_action_pressed("ui_up"):
		add_central_force(player_rotation.transform.basis.z * player_direction * Globals.player_thrust * delta)
		
	if Input.is_action_pressed("ui_down"):
		add_central_force(player_rotation.transform.basis.z * -player_direction * Globals.player_thrust * delta)
		
	
	
