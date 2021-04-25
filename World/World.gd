extends Spatial

onready var preload_floor = preload("res://World/FloorInstance.tscn")

var current_floor_loc = Vector3(0,0,0)
var floor_number


export var tween_floors_time = 5

func _ready():
	Globals.register_world(self)
	
	
func _process(delta):
	
	var new_floor = preload_floor.instance()
	var strt_loc = self.global_transform.origin
	
	
	if Globals.changing_floors:
		
		Globals.changing_floors = false
		
		Globals.floor_number = Globals.floor_number -1
	
		current_floor_loc = current_floor_loc - Vector3(0,100,0)

		add_child(new_floor)
		new_floor.global_transform.origin = Vector3(0,-100,0)
		
		$"world_tween".interpolate_property(self, "translation", strt_loc, -current_floor_loc, tween_floors_time, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
		$"world_tween".start()
	
	
