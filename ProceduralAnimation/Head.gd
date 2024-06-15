class_name ProceduralHead extends CharacterBody3D


# Constants
const SPEED = 3.0
const ACCEL = 1.0
const TURN_SPEED = 5.0
const ALIGN_SPEED = 1.0

# Export variables
@export var forward_direction: Vector3 = Vector3.BACK

# Variables
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# In-scene nodes
@onready var front_floor = $FrontFloor
@onready var floor_detector = $FloorDetector
@onready var mesh = $Mesh
@onready var front_floor_ray_display = $FrontFloor/RayDisplay
@onready var floor_detector_ray_display = $FloorDetector/RayDisplay


func _physics_process(delta):
	if not floor_detector.is_colliding():
		forward_direction.y -= gravity * delta
		floor_detector_ray_display.mesh.material.albedo_color = Color.WHITE
	else:
		forward_direction.y += gravity * delta
		floor_detector_ray_display.mesh.material.albedo_color = Color.BLACK
	
	if not front_floor.is_colliding():
		front_floor_ray_display.mesh.material.albedo_color = Color.WHITE
	else:
		front_floor_ray_display.mesh.material.albedo_color = Color.BLACK
	
	#forward_direction = forward_direction.move_toward(Vector3.DOWN, ALIGN_SPEED)
	
	forward_direction = forward_direction.normalized()
	rotation.x = forward_direction.x
	#mesh.rotation = forward_direction
	
	
	velocity = velocity.move_toward(forward_direction * SPEED, ACCEL)
	
	
	move_and_slide()
