extends KinematicBody2D

onready var timer: Timer = $Timer

onready var player = get_parent()
export var speed: int = 300



onready var end_of_gun: Position2D = $EndOfGun
export var Bullet: PackedScene

var movement: Vector2 = Vector2()

onready var raycast: RayCast2D = $RayCast2D

func _ready():
	Global.Player = self
	Global.Can_Move = true

func _physics_process(delta):
	movement = Vector2()
	
	if Global.Can_Move:
		if Input.is_action_pressed("up"):
			movement.y -= 1
		if Input.is_action_pressed("down"):
			movement.y += 1
		if Input.is_action_pressed("left"):
			movement.x -= 1
		if Input.is_action_pressed("right"):
			movement.x += 1
		
		movement = movement.normalized() * speed
		movement = move_and_slide(movement)
		look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		#Original raycast shot for testing
#		var a = raycast.get_collider()
#		if raycast.is_colliding() and a.has_method("die"):
#			a.die()
#

func player_die():
	var player_sprite = get_node("PlayerSprite")
	var camera = get_node("Camera2D")
#	Global.Can_Move = false
	player_sprite.hide()
	timer.start()
	

func _on_Timer_timeout():
#	Global.Can_Move = true
	get_tree().reload_current_scene()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var bullet_instance = Bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = end_of_gun.global_position
	var target = get_global_mouse_position()
#	below line is the long form for getting the vector math for where the bullet should be going
#	var direction_to_mouse = target - bullet_instance.global_position
	var direction_to_mouse = bullet_instance.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
