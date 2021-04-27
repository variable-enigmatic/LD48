extends Spatial

onready var preload_enemy_01 = preload("res://Enemy01/enemy_01.tscn")

var player_explosion_audio_played = false


#var spawn_enemies = false
#var spawn_enemies_timer
var enemy_start_count = 6
export var enemy_count = 6

func _ready():
	
	randomize()

	Globals.register_world_parent(self)
	
func _on_spawn_enemies_timer_timeout():
	
	if Globals.spawn_enemies:

		randomize()

		var x_range = Vector2(-34,34)
		var y_range = Vector2(-34,34)

		var random_x = randi() % int(x_range[1]-x_range[0]) + 1 + x_range[0] 
		var random_y = randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]

		var spawn_enemy_01 = preload_enemy_01.instance()
		
		$"enemy_spawn".play()

		if enemy_count >= 2:
			enemy_count -= 1
			add_child(spawn_enemy_01)
			spawn_enemy_01.global_transform.origin = Vector3(random_x,0,random_y)
		else:
			enemy_count = Globals.enemy_start_count
			Globals.spawn_enemies = false
			
			
func _process(delta):
	if Globals.game_over:
		Globals.game_over = false
		if !player_explosion_audio_played:
			player_explosion_audio_played = true
			$"player_explosion".play()
			

	

