extends Node2D


func _ready():
	if global.body_exited_cave==true: 
		$player.position.x=662
		$player.position.y=14
	
	if global.body_exited_lab==true: 
		$player.position.x=1017
		$player.position.y=106
	else :
		$player.position.x=149
		$player.position.y=680
		


func _process(delta):
	pass
	

	


func _on_stairs_body_entered(body):
	if body.has_method("player") : 
		get_tree().change_scene_to_file("res://scenes/lab.tscn")


func _on_cave_entrance_body_entered(body):
	if body.has_method("player") and global.quest_accepted==true: 
		get_tree().change_scene_to_file("res://scenes/cave.tscn")
