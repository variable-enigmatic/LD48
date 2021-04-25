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



#
#var current_weapon = 

# World Globals

var changing_floors = false
var world_node
export var world_lerp = 0.01
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

#func register_world_tween(reg_world_tween):
#	world_tween = reg_world_tween
	
#func add_floor():
#
#	current_floor_loc = current_floor_loc - Vector3(0,20,0)
#	var new_floor = preload_floor.instance()
#	world_node.add_child(new_floor)
#	new_floor.global_transform.origin = current_floor_loc
#
#	print(str(current_floor_loc))
#
#
#func down_one_level():
#
#	changing_floors = true
#	floor_number = Globals.floor_number -1
#
#	add_floor()
#
#	world_tween.interpolate_property(world_node, "translation", world_node.global_transform.origin, -current_floor_loc, tween_floors_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#	world_tween.start()
#
#	changing_floors = false
#



