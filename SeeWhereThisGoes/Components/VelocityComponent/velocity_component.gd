extends Node2D

#@onready var player: Node2D = %Player
@onready var owner_sprite: Sprite2D = get_parent().get_child(00)
@onready var owner_node: Node2D = get_parent()


@export var max_speed: int = 200
@export var stop_distance: float = 150.0
@export var speed_lerp_weight = 1
@export var turn_lerp_weight = 1


var velocity = Vector2.ZERO

func _ready() -> void:
	print("Parent: ", get_parent())
	print("Children: ", get_children())


func accelerate_in_direction(direction: Vector2, delta: float):
	var desired_velocity = direction * max_speed
	velocity = velocity.lerp(desired_velocity, speed_lerp_weight * delta)
	owner_node.global_position += velocity * delta


func accelerate_to_target(target: Node2D, delta: float):
	if target == null:
		print("Null target")
		return
	if owner_sprite == null:
		print("Null owner sprite")
		return
	#print("target " + str(target))
	#
	#print("Player is " + str(player))
	var direction_to_target = (target.global_position - global_position).normalized()
	var distance_to_player = global_position.distance_to(target.global_position)
	face_target(target, delta)

	
	if distance_to_player > stop_distance:
		accelerate_in_direction(direction_to_target, delta)
	else: 
		velocity = Vector2.ZERO
		#face_target(target, delta)
#
#
#func update_position(delta: float):
	#position += velocity * delta
func face_target(target: Node2D, delta: float):
	var sprite_orientation_adjustment = PI/2
	var angle_to_target = (target.global_position - owner_node.global_position).angle() + sprite_orientation_adjustment
	owner_node.rotation = lerp_angle(owner_node.rotation, (angle_to_target), turn_lerp_weight * delta) # adding PI/2 because the sprite faces up normally so we're adding a quarter turn to the right for the sprite to make it face correctly with this math.  Look at the length of this comment out here!
	
