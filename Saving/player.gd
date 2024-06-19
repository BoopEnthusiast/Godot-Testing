extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var label_1 = $Label1
@onready var label_2 = $Label2
@onready var label_3 = $Label3

var data_1 = "A"
var data_2 = "B"
var data_3 = "C"

var save_thread: Thread


func _ready():
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load("user://player.cfg")

	# If the file didn't load, ignore it.
	if err != OK:
		return

	# Iterate over all sections.
	for player in config.get_sections():
		# Fetch the data for each section.
		data_1 = config.get_value(player, "data_1")
		data_2 = config.get_value(player, "data_2")
		data_3 = config.get_value(player, "data_3")
	
	update_data()


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		var tmp_data = data_1
		data_1 = data_3
		data_3 = data_2
		data_2 = tmp_data
	
	update_data()
	
	if Input.is_action_just_pressed("ui_undo"):
		save_thread = Thread.new()
		save_thread.start(save_data)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


func update_data() -> void:
	label_1.text = "1: " + data_1
	label_2.text = "2: " + data_2
	label_3.text = "3: " + data_3


func save_data() -> void:
	var config = ConfigFile.new()
	config.set_value("Player", "data_1", data_1)
	config.set_value("Player", "data_2", data_2)
	config.set_value("Player", "data_3", data_3)
	config.save("user://player.cfg")


func _exit_tree():
	if save_thread:
		save_thread.wait_to_finish()
