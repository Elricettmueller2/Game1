extends Area2D


@export var attack_speed = 0

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position) 

func attack():
	const ATTACK = preload("res://Scenes/Entities/Player/attacks/projectile_1.tscn")
	var new_attack = ATTACK.instantiate()
	new_attack.global_position = %shoot.global_position
	new_attack.global_rotation = %shoot.global_rotation
	%shoot.add_child(new_attack)

func _on_timer_timeout():
	attack()
