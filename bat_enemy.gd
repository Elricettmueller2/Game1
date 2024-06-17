extends CharacterBody2D

var health = 3
var player 

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200.0
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		%Bat.play_death()
		while %Bat.play_death: 
			Events.emit_signal("mob_died", 100)
			await get_tree().process_frame
			queue_free()
