extends CharacterBody2D

var sprite: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func for_stabler_marmot_7():
	if velocity.x <= 0 and velocity.y <= 0:
		
		if velocity.x <= velocity.y:
			sprite.flip_h = true
			sprite.play("side_walk")
		
		else:
			sprite.play("back_walk")
	
	elif velocity.x >= 0 and velocity.y <= 0:
		
		if velocity.x <= velocity.y:
			sprite.play("back_walk")
		
		else:
			sprite.flip_h = false
			sprite.play("side_walk")
	
	elif velocity.x <= 0 and velocity.y >= 0:
		
		if velocity.x <= velocity.y:
			sprite.flip_h = true
			sprite.play("side_walk")
		
		else:
			sprite.play("front_walk")
	
	elif velocity.x >= 0 and velocity.y >= 0:
		
		if velocity.x <= velocity.y:
			sprite.play("front_walk")
		
		else:
			sprite.flip_h = false
			sprite.play("side_walk")
