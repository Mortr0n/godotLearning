extends Node2D

@onready var player: Node2D = %Player
@onready var enemy_sprite: Sprite2D = $Sprite2D
@onready var velocity_component: Node2D = $VelocityComponent


#@export var velocity_component: PackedScene 
@export var max_speed: int = 200
@export var stop_distance: float = 150.


var velocity = Vector2.ZERO


func _process(delta: float) -> void:
	if velocity_component == null:
		print("Velocity component is null")
		return
	if player != null:
		velocity_component.accelerate_to_target(player, delta)
	
#
#func accelerate_to_player():
	#var this_enemy = self as Node2D
	#if this_enemy == null:
		#print("Owner_node2d is null")
		#return
	#
	#print("Owner node is ")
	#print(this_enemy)
	#if player == null:
		#print("Player for accelerate to player is null")
		#return
	#
	#print("Player is " + str(player))
	#var direction_to_player = (player.global_position - this_enemy.global_position).normalized()
	#var distance_to_player = global_position.distance_to(player.global_position)
	#
	#enemy_sprite.rotation = direction_to_player.angle() + PI/2 # adding PI/2 because the sprite faces up normally so we're adding a quarter turn to the right for the sprite to make it face correctly with this math.  Look at the length of this comment out here!
	#
	#
	#if distance_to_player > stop_distance:
		#accelerate_in_direction(direction_to_player)
	#else: 
		#velocity = Vector2.ZERO



func accelerate_in_direction(direction: Vector2):
	var desired_velocity = direction * max_speed
	velocity = desired_velocity #this is for adding lerp later for smoother motion
	
	global_position += velocity * get_process_delta_time()

func update_position(delta: float):
	position += velocity * delta
