extends CharacterBody2D

const SPEED = 150.0
var health = 100
var player_alive=true
var enemy_inrange=false
var ennemy_attack_cooldown=true
var attack_ip = false



func _physics_process(delta):
	ennemy_attack()
	update_health()
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if direction==Vector2(0,0): 
		if attack_ip==false and player_alive==true:
			$playeranim.play("idle")
	elif direction==Vector2(-1,0):
		if attack_ip==false and player_alive==true: 
			$playeranim.play("run")
			$playeranim.flip_h=true
	elif direction==Vector2(1,0): 
		if attack_ip==false and player_alive==true:
			$playeranim.flip_h=false
			$playeranim.play("run")
	elif direction==Vector2(0,-1): 
		if attack_ip==false and player_alive==true:
			$playeranim.flip_h=false
			$playeranim.play("run")
	elif direction==Vector2(0,1): 
		if attack_ip==false and player_alive==true:
			$playeranim.flip_h=false
			$playeranim.play("run")
	if Input.is_action_just_pressed("attack") and player_alive==true: 
		global.player_attack = true
		attack_ip=true
		$playeranim.play("attacking")
		$attack_timer.start()
		print(global.player_attack)
			
		
		
	move_and_slide()
	
func update_health():
	var healthbar=$healthbar
	healthbar.value=health
	
	


func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inrange=true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inrange=false
func ennemy_attack(): 
	if enemy_inrange==true and ennemy_attack_cooldown==true:
		health=health-10
		ennemy_attack_cooldown=false
		$ennemy_cooldown.start()
		if health<0 :
			player_alive=false
			$player_death.start()
			$playeranim.play("death")
			global.body_exited_cave=false
			global.body_exited_lab=false
		if health<100 : 
			$regeneration.start()
			

func player(): 
	pass
	
func _on_ennemy_cooldown_timeout():
	ennemy_attack_cooldown=true
	
func _on_attack_timer_timeout():
	$attack_timer.stop()
	attack_ip=false
	global.player_attack=false



func _on_player_death_timeout():
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")


func _on_regeneration_timeout():
	if health < 100:
		health=health+20 
	if health>100 : 
		health=100
	elif  health<0  :
		health=0
