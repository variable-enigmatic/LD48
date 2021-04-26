extends Spatial

func _ready():
	
	Globals.register_wormhole(self)
	
func _process(delta):

	rotate_y(0.3)
	
func _on_Area_body_entered(body):
	
	if body.is_in_group("player"):
	
		if Globals.changing_floors:
			Globals.change_floors = false
		
		elif !Globals.changing_floors:
			Globals.change_floors = true
			self.queue_free()
