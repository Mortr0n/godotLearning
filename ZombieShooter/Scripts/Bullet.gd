extends Area2D
class_name Bullet


export var speed: int = 10

var direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity


func set_direction(direction: Vector2):
	self.direction = direction
	rotation = direction.angle()

