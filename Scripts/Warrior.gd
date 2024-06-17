extends Node2D

func play_walk():
	%Sprite.play("walk")

func play_attack():
	%Sprite.play("attack")

func _on_player_turn_sprite(turn):
	$Sprite.flip_h = turn

func play_idle():
	%Sprite.play("idle")
		
