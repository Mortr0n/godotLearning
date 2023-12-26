extends KinematicBody2D


onready var raycast: RayCast2D = $RayCast2D
onready var collision: CollisionShape2D = $CollisionShape2D

var player_scene = preload("res://Scenes/Player.tscn")

var speed: int = 100

func _physics_process(delta):
	var pos_to_player
	if Global.Player == null:
		return
		
	if is_instance_valid(Global.Player):
		pos_to_player = Global.Player.global_position - global_position
		pos_to_player = pos_to_player.normalized()
		move_and_collide(pos_to_player * speed * delta)
		look_at(Global.Player.position)
	
	
	
	if raycast.is_colliding():
		var a = raycast.get_collider()
		if a.has_method("player_die"):
			a.player_die()
	
func die():
	queue_free()
