extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

	


func _on_skip_timeout():
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")
