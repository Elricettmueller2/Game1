extends CharacterBody2D

signal health_depleted
signal collected(collectable)
signal turn_sprite
@export var speed := 300
var screen_size := Vector2()


@export var health = 100
@export var expirience = 0
@export var attack_speed = 0
@export var level = 1

func _ready() -> void:
	%Warrior.play_idle()
	screen_size = get_viewport_rect().size
	$Hurtbox.monitoring = true
 
func _physics_process(delta: float) -> void:
	var velocity := Vector2.ZERO  # The player's movement vector.
	
	# Input handling to determine the movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	# Normalize and scale the velocity vector.
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
		# Animation handling based on direction.
		if velocity.x > 0:
			turn_sprite.emit(false)
			$Warrior.play_walk()
		elif velocity.x < 0:
			turn_sprite.emit(true)
			$Warrior.play_walk()
		elif velocity.x == 0 and velocity.y != 0:
			$Warrior.play_walk()
	else:
		$Warrior.play_idle()
	# Set the velocity for movement
	self.velocity = velocity  

	# Physics-based movement handled by move_and_slide
	move_and_slide()
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = $Hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		print("getting attacked")
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%Healthbar.value = health
		if health <= 0.0:
			health_depleted.emit()
	
func collect(collectable):
	collected.emit(collectable)
