extends Control



func _process(delta):
	
	$energy_bar.value = Globals.player_energy

	$floor_count.text = str(Globals.floor_number)

	
	if Globals.wormhole_opened:
		$wormhole_status.text = "WORMHOLE OPENED"
		
	elif !Globals.wormhole_opened:
		$wormhole_status.text = "Wormhole Closed"
