extends Node

# Player Globals

var player_thrust = 800
var player_maxspeed = 40.0
var player_rot_speed = 0.07

var player_max_energy = 100
var player_energy = 100
var player_energy_recharge = 0.01

var player_node

func register_player(reg_player):
	player_node = reg_player
