extends Node

#@onready var player: Node2D = %Player
@onready var owner_sprite: Sprite2D = get_parent().get_node("Sprite2d")


@export var max_speed: int = 200
@export var stop_distance: float = 150.0


var velocity = Vector2.ZERO


func accelerate_in_direction(direction: Vector2, delta: float):
	var desired_velocity = direction * max_speed
	velocity = desired_velocity #this is for adding lerp later for smoother motion
	
	owner.global_position += velocity * delta


func accelerate_to_target(target: Node2D, delta: float):
	if target == null:
		print("Null target")
		return
	
	print("target " + str(target))
	#
	#print("Player is " + str(player))
	var direction_to_target = (target.global_position - global_position).normalized()
	var distance_to_player = global_position.distance_to(target.global_position)
	
	owner_sprite.rotation = direction_to_target.angle() + PI/2 # adding PI/2 because the sprite faces up normally so we're adding a quarter turn to the right for the sprite to make it face correctly with this math.  Look at the length of this comment out here!
	
	
	if distance_to_player > stop_distance:
		accelerate_in_direction(direction_to_target, delta)
	else: 
		velocity = Vector2.ZERO
#
#
#func update_position(delta: float):
	#position += velocity * delta
