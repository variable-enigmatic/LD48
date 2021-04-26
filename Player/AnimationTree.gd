extends AnimationTree

func _ready():
	set("parameters/Spawn/active", true)
	

func _process(delta):
	
	if Globals.change_floors:
		set("parameters/Dive/active", true)

