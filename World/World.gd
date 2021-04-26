extends Spatial

onready var preload_floor = preload("res://World/FloorInstance.tscn")

onready var preload_wormhole = preload("res://Assets/wormhole.tscn")

var current_floor_loc = Vector3(0,0,0)
var floor_number

export var floor_distance = 30

export var tween_floors_time = 1.2

var spawn_player_timer

var spawn_wormhole_timer

var change_floors_timer

func start_wormhole_timer():
	
		spawn_wormhole_timer = Timer.new()
		spawn_wormhole_timer.connect("timeout", self, "_on_spawn_wormhole_timer_timeout")
		add_child(spawn_wormhole_timer)
		spawn_wormhole_timer.set_one_shot(true)
		spawn_wormhole_timer.set_wait_time(10)
		spawn_wormhole_timer.start()

func new_floor():
	
	var new_floor = preload_floor.instance()
	add_child(new_floor)
	new_floor.global_transform.origin = Vector3(0,-floor_distance,0)
	
		
func _on_spawn_player_timer_timeout():
	
	Globals.spawn_player()
	spawn_player_timer.queue_free()

func _on_spawn_wormhole_timer_timeout():

	randomize()

	var wormhole_x_range = Vector2(-34,34)
	var wormhole_y_range = Vector2(-34,34)

	var wormhole_random_x = randi() % int(wormhole_x_range[1]-wormhole_x_range[0]) + 1 + wormhole_x_range[0] 
	var wormhole_random_y = randi() % int(wormhole_y_range[1]-wormhole_y_range[0]) + 1 + wormhole_y_range[0]

	var wormhole_spawn = preload_wormhole.instance()
	
	add_child(wormhole_spawn)
	
	wormhole_spawn.global_transform.origin = Vector3(wormhole_random_x,0,wormhole_random_y)
	
	spawn_wormhole_timer.queue_free()
	
	Globals.wormhole_opened = true
	
func _ready():
	
	randomize()

	Globals.register_world(self)

func _process(delta):
	
	if Globals.game_starting:
		Globals.game_starting = false
		
		$"world_tween".interpolate_property(self, "translation", Vector3(0,-30,0), Vector3(0,0,0) , 1.2, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
		$"world_tween".start()
		
		spawn_player_timer = Timer.new()
		spawn_player_timer.connect("timeout", self, "_on_spawn_player_timer_timeout")
		add_child(spawn_player_timer)
		spawn_player_timer.set_one_shot(true)
		spawn_player_timer.set_wait_time(1.2)
		spawn_player_timer.start()
		
		start_wormhole_timer()
	
	if Globals.change_floors:
		Globals.wormhole_opened = false
		Globals.change_floors = false
		Globals.changing_floors = true
		Globals.floor_number = Globals.floor_number -1
		
		var strt_loc = self.global_transform.origin
		current_floor_loc = current_floor_loc - Vector3(0,floor_distance,0)
		
		$"world_tween".interpolate_property(self, "translation", strt_loc, -current_floor_loc, tween_floors_time, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
		$"world_tween".start()
		
		start_wormhole_timer()
		
func _on_world_tween_tween_all_completed():
	Globals.spawn_enemies = true
	Globals.changing_floors = false
	new_floor()

