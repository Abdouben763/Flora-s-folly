extends Node2D


func _process(delta):
	$AnimationPlayer.play("black_screen1")
	

	


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/burnedmap.tscn")
