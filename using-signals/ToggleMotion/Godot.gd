extends Sprite

var speed = 400
var angular_speed = PI

# called after node and all it's children have been added to the scene and are ready
func _ready():
	var timer = get_node("VisibilityTimer")
	timer.connect("timeout", self, "_on_Timer_timeout")

# method called on every frame.  Delta is the time since last frame.  
func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_Button_pressed():
	set_process(!is_processing())

func _on_Timer_timeout():
	visible = !visible
