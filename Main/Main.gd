extends Control

onready var tween = get_node("Tween")

func _process(delta):
	
	if Input.is_action_just_pressed("ui_enter"):
		Globals.game_starting = true
		tween.interpolate_property(self, "rect_position", Vector2(0,0), Vector2(0,-1000), 2, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
		tween.start()
	


func _on_Tween_tween_all_completed():
	queue_free()
	
