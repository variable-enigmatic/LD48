extends Spatial




func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_lifespan_timeout():
	queue_free()
