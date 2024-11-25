extends CharacterBody2D
var text_index = -1
var texts = [
	"hey,there my name is simon a scientist, the robots who survived are here",
 "there seems to be a huge problem with the plants they are charged with nuclear energy ", 
"i need you to do something for me, there is one plant i want to study, its a big tree ",
"will you get it for me?!!"
]  

func _process(delta):
	if global.player_near==true and Input.is_action_just_pressed("talk") :
		
		$textbox.show()
		$hey.hide()
		print(text_index)
		
	elif global.player_near==false: 
		$textbox.hide()
		
func _on_trigger_body_entered(body):
	if body.has_method("player"): 
		global.player_near=true
		$hey.show()
func _on_trigger_body_exited(body):
	if body.has_method("player"):
		global.player_near=false 
		$hey.hide()
		$textbox.hide()
	



func _input(event):
	if global.player_near==true:
		if event is InputEventKey and event.pressed:
			if event.keycode == KEY_Z:  # Change to the desired key
				next_text()

func next_text():
		text_index += 1
		if text_index==3:
			$textbox/yes.show()
			$textbox/no.show()
		if text_index >= texts.size():
			text_index = 3
		update_text()

func update_text():
	$textbox/npc_text.text = texts[text_index]
	

func _on_yes_pressed():
	global.quest_accepted=true
	$textbox.hide()
	


func _on_no_pressed():
	$textbox.hide()
	global.quest_accepted=false
	
