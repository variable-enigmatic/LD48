extends RigidBody

func _ready():
	set_bounce(1)

func _on_lifespan_timeout():
	queue_free()

func _on_enemy_01_projectile_body_entered(body):
	
	if body.is_in_group("player"):
		queue_free()
