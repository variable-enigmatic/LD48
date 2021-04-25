extends Spatial

onready var preload_projectile = preload("res://Player/projectile_one.tscn")

onready var player = get_node("../../")

onready var rot_node = get_node("../../rotation/")

export var veloticy = -100

func _ready():
	pass 

func _process(delta):
	
	if Input.is_action_just_pressed("ui_fire"):
		
		var projectile = preload_projectile.instance()
		get_node("/root").add_child(projectile)

		projectile.global_transform.origin = rot_node.global_transform.origin
		projectile.rotation = rot_node.rotation

		projectile.apply_central_impulse(projectile.transform.basis.z * veloticy)
