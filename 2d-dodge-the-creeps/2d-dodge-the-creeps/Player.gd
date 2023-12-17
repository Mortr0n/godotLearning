extends Area2D

signal hit

export var speed = 400
var screen_size = Vector2.ZERO


func _ready():
	screen_size = get_viewport_rect().size

	print(screen_size)


func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		
	if Input.is_action_pressed("move_up"): # remember that positive y is actually down due to original screens starting in the top left corner for pixel zero.
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		
#	Ensure player moves at constanct speed regardless of direction.  by pressing 2 keys you will have double the direction if we're using this += method of movement
	if direction.length() > 0:
		direction = direction.normalized()
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	if direction.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direction.x < 0
	elif direction.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.flip_v = direction.y > 0
	

func start(new_position):
	position = new_position
	show()
	$CollisionShape2D.disabled = false

func _on_Player_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")
	
	
	
	
