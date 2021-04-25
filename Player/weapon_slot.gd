extends Position3D

onready var load_weapon = load("res://Player/player_weapon_one.tscn").instance()

func _ready():

	self.add_child(load_weapon)


