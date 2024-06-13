class_name ProceduralHead extends CharacterBody3D


# Constants
const SPEED = 3.0
const ACCEL = 1.0
const TURN_SPEED = 5.0

# Export variables
@export var forward_direction: Vector3 = Vector3.BACK

# Variables
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# In-scene nodes
@onready var front_floor = $FrontFloor
@onready var floor_detector = $FloorDetector
@onready var mesh = $Mesh


func _physics_process(delta):
	if not floor_detector.is_colliding():
		forward_direction.y -= gravity * delta
	else:
		forward_direction.y += gravity * delta
	
	if not front_floor.is_colliding():
		forward_direction = forward_direction - forward_direction / 10
	
	forward_direction = forward_direction.normalized()
	rotation.x = forward_direction.x
	mesh.rotation = forward_direction
	
	velocity = velocity.move_toward(forward_direction * SPEED, ACCEL)
	
	
	move_and_slide()
