extends AnimationTree

func _process(delta):
	
	if Globals.changing_floors:
		set("parameters/OneShot/active", true)
