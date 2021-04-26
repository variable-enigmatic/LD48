extends Node



onready var preload_player = preload("res://Player/player.tscn")

onready var world_tween = get_node("/root/WorldParent/World/world_tween")

onready var preload_enemy_01 = preload("res://Enemy01/enemy_01.tscn")

var player_node
var player_thrust = 800
var player_maxspeed = 40.0
var player_rot_speed = 0.07

var player_max_energy = 100
var player_energy = 100
var player_energy_recharge = 0.01


var world_parent_node
var world_node
var change_floors = false
var changing_floors = false

var floor_number = 99
var current_floor_loc = Vector3(0,0,0)
var world_loc

var game_starting = false

var spawn_enemies = false
var spawn_enemies_timer
var enemy_count = 9

var wormhole_node

func _on_spawn_enemies_timer_timeout():
	
	randomize()
	
	var x_range = Vector2(-70,70)
	var y_range = Vector2(-70,70)

	var random_x = randi() % int(x_range[1]-x_range[0]) + 1 + x_range[0] 
	var random_y = randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]

	var spawn_enemy_01 = preload_enemy_01.instance()
	
	print(Vector2(random_x,random_y))
	
	if enemy_count >= 2:
		enemy_count -= 1
		add_child(spawn_enemy_01)
		spawn_enemy_01.global_transform.origin = Vector3(random_x,0,random_y)
	else:
		enemy_count = enemy_count + 9
		spawn_enemies = false
		spawn_enemies_timer.queue_free()

func spawn_player():
	var spawn_player = preload_player.instance()
	add_child(spawn_player)
	
func register_wormhole(reg_wormhole):
	wormhole_node = reg_wormhole

func register_player(reg_player):
	player_node = reg_player

func register_world(reg_world):
	world_node = reg_world
	
func register_world_parent(reg_world_parent):
	world_parent_node = reg_world_parent
	
func _ready():
	
	randomize()

func _process(delta):
	
	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

	if spawn_enemies:
		spawn_enemies = false
		
		spawn_enemies_timer = Timer.new()
		spawn_enemies_timer.connect("timeout", self, "_on_spawn_enemies_timer_timeout")
		add_child(spawn_enemies_timer)
		spawn_enemies_timer.set_wait_time(0.2)
		spawn_enemies_timer.start()
