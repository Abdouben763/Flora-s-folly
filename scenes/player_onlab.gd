extends CharacterBody2D

const SPEED = 200.0
var health = 100
var player_alive=true
var enemy_inrange=false
var ennemy_attack_cooldown=true
var attack_ip = false



func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if direction==Vector2(0,0): 
		if attack_ip==false and player_alive==true:
			$playeranim_lab.play("idle")
	elif direction==Vector2(-1,0):
		if attack_ip==false and player_alive==true: 
			$playeranim_lab.play("run")
			$playeranim_lab.flip_h=true
	elif direction==Vector2(1,0): 
		if attack_ip==false and player_alive==true:
			$playeranim_lab.flip_h=false
			$playeranim_lab.play("run")
	elif direction==Vector2(0,-1): 
		if attack_ip==false and player_alive==true:
			$playeranim_lab.flip_h=false
			$playeranim_lab.play("run")
	elif direction==Vector2(0,1): 
		if attack_ip==false and player_alive==true:
			$playeranim_lab.flip_h=false
			$playeranim_lab.play("run")
			print(global.player_input)
		
	move_and_slide()
func player():
	pass

	
	
