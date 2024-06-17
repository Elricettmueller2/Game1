extends Node2D
	
func spawn_mob():
	var new_mob = preload("res://Scenes/Entities/Enemies/bat/bat_enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	new_mob.player = get_node("Player2")
	add_child(new_mob)

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	
func _on_timer_timeout():
	spawn_mob()
	


