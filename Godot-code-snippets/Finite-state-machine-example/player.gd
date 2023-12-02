class_name Player
extends CharacterBody2D

@onready var animations : AnimatedSprite2D = $littleMan
@onready var state_machine = $StateMachine

func _ready() -> void:
	# initialise state machine by passing ref of the player to the states 
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)



"""
var state
var state_manager
@onready var animation = $littleMan

var speed = 100

# (idle state) -> (run state) -> (idle state) 
# attack state -> 

func _ready():
	state_manager = StateManager.new()
	change_state("idle")

func get_input():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var direction 
	if velocity.x < 0: 
		direction = "west" # Left"
		move_left()
	elif velocity.x > 0: 
		direction = "east" # "Right"
		move_right()
	elif velocity.y < 0: 
		direction = "backward" #"Up"
		move_up()
	elif velocity.y > 0:
		direction = "forward" # down
		move_down()
	elif velocity.length() == 0:
		idle() # call idle animation <-- not defined yet
	
func _process(delta):
	get_input()
	move_and_slide()
	print(state)

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_manager.get_state(new_state_name).new()
	state.setup(funcref(self, "change_state"), $littleman, self)
	state.name = str(new_state_name)
	add_child(state)
	

# @onready var animation = $littleMan

# func _ready():
# 	animation.play("idle")

"""


"""
var screen_size  # Size of the game window.

@export var speed: int = 50
@export var sprintSpeed: int = 100
@onready var animation = $littleMan
@export var prev_direction = "" 

func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var sprint = 0
	# check if sprint button is pressed - programmed in the project -> input mapping area
	if Input.is_action_pressed("sprint"):
		velocity = moveDirection * sprintSpeed
		return
	velocity = moveDirection * speed 
	
func updateAnimation():
	if velocity.length() == 0:
		# if the player has stopped, check what prev direction was so you can play sideways animation. 
		if prev_direction == "":
			animation.play("idle")
			return
		print(prev_direction)
		
		if prev_direction == "forward":
			animation.play(prev_direction+"-walk")
		elif prev_direction == "backward":
			animation.play(prev_direction+"-walk")
		elif prev_direction == "west":
			animation.play(prev_direction+"-walk")
		elif prev_direction == "east":
			animation.play(prev_direction+"-walk")
		return
			
	var direction = "forward"# "Down"
	if velocity.x < 0: 
		direction = "west" # Left"
	elif velocity.x > 0: 
		direction = "east" # "Right"
	elif velocity.y < 0: 
		direction = "backward" #"Up"

	animation.play(direction+"-walk")
	prev_direction = direction 

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	_ready()
	handleInput()
	move_and_slide() # could use move_and_collide
	updateAnimation()
"""
