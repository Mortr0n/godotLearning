extends ParallaxBackground

@onready var background_layer := $BackGroundParallaxLayer
@onready var stars_layer := $StarsParallaxLayer
@onready var planets_layer := $PlanetsParallaxLayer
@onready var asteroids_layer := $AsteroidParallaxLayer
@onready var player := get_parent().get_child(0)

@export var speed = 0

@export var direction = Vector2.DOWN

var player_velocity: Vector2

func _ready() -> void:
	player_velocity = player.velocity
	#stars_layer.motion_scale =Vector2(0,0)
	#planets_layer.motion_scale = Vector2(0,0)
	#asteroids_layer.motion_scale = Vector2(0,0)
	#asteroids_layer.motion_offset = Vector2(0, 0)
	#stars_layer.motion_offset = Vector2(0, 0)
	#planets_layer.motion_offset = Vector2(0, 0)
	#scroll_base_offset = Vector2(0,0)

func _process(delta: float) -> void:
	#print(player)
	if player.velocity.length() > 0:
		#scroll_base_offset = player_velocity * .1
		#scroll_base_offset = scroll_base_offset.lerp(player_velocity * delta, 0.1)
		background_layer.motion_scale =  Vector2(.4, .4) + player_velocity
		stars_layer.motion_scale = Vector2(.1,.1) + player_velocity 
		planets_layer.motion_scale = Vector2(.15, .15) + player_velocity  
		asteroids_layer.motion_scale = Vector2(.25, .25) + player_velocity  
