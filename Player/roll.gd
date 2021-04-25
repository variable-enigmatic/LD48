extends Position3D

export var slerp_weight = 0.1

func _process(delta):
	
	var strt_rot = transform.basis.get_rotation_quat()
	var tgt_rot = $"../roll_target".transform.basis.get_rotation_quat()
	var slerp_to = strt_rot.slerp(tgt_rot,slerp_weight)
	transform.basis = Basis(slerp_to)
