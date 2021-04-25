extends Spatial

onready var preload_floor = preload("res://World/FloorInstance.tscn")

var current_floor_loc = Vector3(0,0,0)
var floor_number

export var floor_distance = 50

export var tween_floors_time = 1.2

var timer

func _ready():
	
	Globals.register_world(self)
	
#	timer = Timer.new()
#	timer.set_wait_time(1)
#	timer.connect("timeout", self, "_timeout")
#	add_child(timer)

	
func _timeout():
	pass

#
	
func _process(delta):
	
	if Globals.changing_floors:
		
		var new_floor = preload_floor.instance()
		var strt_loc = self.global_transform.origin
		Globals.changing_floors = false
		Globals.floor_number = Globals.floor_number -1
		current_floor_loc = current_floor_loc - Vector3(0,floor_distance,0)
		add_child(new_floor)
		new_floor.global_transform.origin = Vector3(0,-floor_distance,0)
		$"world_tween".interpolate_property(self, "translation", strt_loc, -current_floor_loc, tween_floors_time, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
		$"world_tween".start()
		
		
	
