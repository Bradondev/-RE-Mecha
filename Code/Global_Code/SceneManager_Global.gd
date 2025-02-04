extends Node



func  ChangeScene(NewScene:String)->void:
	get_tree().change_scene_to_file(NewScene)
	await Transition()
	pass


func  Transition(TransitonOut:bool = true)->void:
	if TransitonOut:
		pass
	else:
		pass
