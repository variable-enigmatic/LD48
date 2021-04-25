extends Node

# Player Globals

onready var preload_player = preload("res://Player/player.tscn")

var player_thrust = 800
var player_maxspeed = 40.0
var player_rot_speed = 0.07

var player_max_energy = 100
var player_energy = 100
var player_energy_recharge = 0.01

var player_node

# World Globals

var changing_floors = false
var world_node
var floor_number = 99
var current_floor_loc = Vector3(0,0,0)
var world_loc

# Functions

func _ready():
	var spawn_player = preload_player.instance()
	add_child(spawn_player)
	
func register_player(reg_player):
	player_node = reg_player

func register_world(reg_world):
	world_node = reg_world
	
func register_wormhole(reg_wormhole):
	wormhole_node = reg_wormhole
