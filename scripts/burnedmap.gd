extends Node2D


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("plants_attck")
	



func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/blackscreen_2.tscn")
