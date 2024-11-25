extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/start.grab_focus()



func _on_start_pressed():
	$enter.play()
	get_tree().change_scene_to_file("res://scenes/loading.tscn")
	
func _on_quit_pressed():
	$enter.play()
	get_tree().quit()

func _physics_process(delta):
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		$scroll.play()
