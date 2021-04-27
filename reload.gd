extends Control


func _ready():
	Globals.reset()

func _on_Timer_timeout():
	
	get_tree().change_scene("res://World/WorldParent.tscn")
