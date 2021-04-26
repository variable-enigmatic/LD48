extends AnimationTree


func _ready():
	pass # Replace with function body.



func _process(delta):
	
	
	if Globals.camera_shake:
		Globals.camera_shake = false
		set("parameters/OneShot/active", true)
		
		
