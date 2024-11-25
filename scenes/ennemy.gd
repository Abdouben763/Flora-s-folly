extends CharacterBody2D

var speed=230
var player_chased=false
var player= null
var health=200
var player_inzone = false
var can_take_damage=true


func _physics_process(delta):
	deal_damage()
	if player_chased==true : 
		position+=(player.position - position)/speed
	
		
func _on_detectionarea_body_entered(body):
	player=body
	player_chased=true

func _on_detectionarea_body_exited(body):
	player=null
	player_chased=false

func enemy():
	pass
	

func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"): 
		player_inzone= true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"): 
		player_inzone= false
		
func deal_damage():
	if  player_inzone==true and global.player_attack==true :
		if can_take_damage==true: 
			health=health-20
			$damage_timer.start()
			can_take_damage=false
			if health<0 : 
				$AnimatedSprite2D.play("death")
				$death_timer.start()
				global.boss_dead=true
				
				
				


func _on_damage_timer_timeout():
	can_take_damage=true

func _on_death_timer_timeout():
	self.queue_free()
