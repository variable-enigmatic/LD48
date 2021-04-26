extends Node

onready var preload_player = preload("res://Player/player.tscn")
onready var world_tween = get_node("/root/WorldParent/World/world_tween")
onready var preload_enemy_01 = preload("res://Enemy01/enemy_01.tscn")
onready var preload_game_over_menu = preload("res://GameOver/game_over.tscn")

var player_node
var player_thrust = 800
var player_maxspeed = 40.0
var player_rot_speed = 0.07

var player_max_energy = 100
var player_energy = 100
var player_energy_recharge = 1
var player_energy_recharge_timer

var world_parent_node
var world_node
var change_floors = false
var changing_floors = false

var floor_number = 0
var current_floor_loc = Vector3(0,0,0)
var world_loc

var game_starting = false
var game_over = false
var game_over_menu = false
var game_over_menu_timer
var load_game_over_menu

var spawn_enemies = false
var wormhole_node
var wormhole_opened = false
var worm_hole_gravity_force = 9000
var camera_node
var camera_shake = false

#func _on_game_over_menu_timeout():
#	load_game_over_menu = preload_game_over_menu.instance()
#	add_child(load_game_over_menu)

func spawn_player():
	var spawn_player = preload_player.instance()
	add_child(spawn_player)
	
func register_camera(reg_camera):
	camera_node = reg_camera
	
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

	if game_over:
		if !game_over_menu:
			game_over_menu = true
#			game_over_menu_timer = Timer.new()
#			game_over_menu_timer.connect("timeout",self,"_on_game_over_menu_timeout")
#			game_over_menu_timer.set_one_shot(true)
#			game_over_menu_timer.set_wait_time(5)
#			game_over_menu_timer.start()
			load_game_over_menu = preload_game_over_menu.instance()
			add_child(load_game_over_menu)
	
