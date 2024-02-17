extends ParallaxBackground

@onready var background_layer := $BackGroundParallaxLayer
@onready var stars_layer := $StarsParallaxLayer
@onready var planets_layer := $PlanetsParallaxLayer
@onready var asteroids_layer := $AsteroidParallaxLayer
@onready var player := get_parent().get_node("Player")


@onready var sprite1: Sprite2D = %BackgroundSprite2D
@onready var sprite2: Sprite2D = %BackgroundSprite2D2


var sprite_width = 0.0

var last_player_direction = Vector2.ZERO


@export var speed = 0

@export var direction = Vector2.DOWN

var player_velocity: Vector2

func _ready() -> void:
	print("Sprite1 ", sprite1)
	print("Sprite2 ", sprite2)
	sprite_width = sprite1.texture.get_width() * sprite1.scale.x
	#player_velocity = player.velocity
	# Initialize the positions of the sprites
	sprite1.position.x = 0
	sprite2.position.x = sprite_width

func _process(delta: float) -> void:
	var player_direction = player.velocity.normalized()
	# Check if the player has changed direction
	if player_direction != last_player_direction:
		last_player_direction = player_direction
		# Reorder the sprites based on the player's direction
		if player_direction.x > 0:  # Moving right
			if sprite1.position.x > sprite2.position.x:
				sprite2.position.x = sprite1.position.x + sprite_width
			else:
				sprite1.position.x = sprite2.position.x + sprite_width
		elif player_direction.x < 0:  # Moving left
			if sprite1.position.x < sprite2.position.x:
				sprite2.position.x = sprite1.position.x - sprite_width
			else:
				sprite1.position.x = sprite2.position.x - sprite_width
	
	#print(player)
	#if player.velocity.length() > 0:
		##scroll_base_offset = player_velocity * .1
		##scroll_base_offset = scroll_base_offset.lerp(player_velocity * delta, 0.1)
		#background_layer.motion_scale =  Vector2(.4, .4) + player_velocity
		#stars_layer.motion_scale = Vector2(.1,.1) + player_velocity 
		#planets_layer.motion_scale = Vector2(.15, .15) + player_velocity  
		#asteroids_layer.motion_scale = Vector2(.25, .25) + player_velocity  

