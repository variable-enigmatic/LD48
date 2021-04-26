extends RigidBody

func _on_lifespan_timeout():
	queue_free()



func _on_enemy_01_projectile_body_entered(body):
	queue_free()
