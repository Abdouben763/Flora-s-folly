extends Node2D






func _on_goto_forest_body_entered(body):
	if body.has_method("player"): 
		get_tree().change_scene_to_file("res://scenes/gameplay.tscn")
		global.from_lab=true
		global.body_exited_lab=true
		global.body_exited_cave=false
