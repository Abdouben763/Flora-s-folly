extends Node2D




func _on_area_2d_body_entered(body):
	if body.has_method("player") and global.boss_dead==true:
		global.body_exited_cave=true
		global.body_exited_lab=false
		get_tree().change_scene_to_file("res://scenes/gameplay.tscn")
