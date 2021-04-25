extends Control
#
#onready var world = Globals.world_node
#
#func _ready():

signal down_one_level


func _on_down_one_level_pressed():
	emit_signal("down_one_level")
	Globals.changing_floors = true
	
#	Globals.world_tween.interpolate_property(Globals.world_node, "translation", Globals.world_node.global_transform.origin, Globals.current_floor_loc, Globals.tween_floors_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#	Globals.world_tween.start()
