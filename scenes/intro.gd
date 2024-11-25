extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("camera_intro")
	


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/balckscreen.tscn")
	
	
