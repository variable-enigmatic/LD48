extends Control


func _process(delta):

	if Input.is_action_just_pressed("ui_quit"):
		
		queue_free()
		
		get_tree().quit
	
	if Input.is_action_just_pressed("ui_restart"):
		
		queue_free()
		
		get_tree().reload_current_scene()
