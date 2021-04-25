extends Control



func _process(delta):
	
	$energy.text = str(Globals.player_energy)
	$speed.text = str(Globals.player_node.player_speed())
	$floor_count.text = str(Globals.floor_number)
