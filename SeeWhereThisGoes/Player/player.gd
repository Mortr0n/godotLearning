extends Node2D



@onready var player_sprite := $Sprite2D


var base_speed := 1600
@export var max_speed := base_speed

@export var velocity := Vector2(0,0)
var direction := Vector2(0,0)

func _ready() -> void:
	player_sprite.rotation = PI/2


func _process(delta: float) -> void:
	var x_direction := Input.get_axis("move_left", "move_right")
	var y_direction := Input.get_axis("move_up", "move_down")
	direction = Vector2(x_direction, y_direction)
	
	if direction.length() > 1:
		direction = direction.normalized()
		
	velocity = max_speed * direction 
	position += velocity * delta
	position = position.snapped(Vector2.ONE)
	
	if direction.length() > 0:
		player_sprite.rotation = velocity.angle() + PI/2
