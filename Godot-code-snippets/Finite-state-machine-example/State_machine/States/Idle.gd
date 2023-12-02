extends State

@export var move_state: State

func enter() -> void:
	#super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if moveDirection:
		# if Input.is_action_just_pressed('ui_left'):
		return move_state
	if prev_state == "west": 
		parent.animations.play("west-walk") # Left"
	elif prev_state == "east": 
		parent.animations.play("east-walk") # "Right"
	elif prev_state == "forward": 
		parent.animations.play("idle") #"Up"
	elif prev_state == "backward": 
		parent.animations.play("backward-walk") # down
	# parent.animations.play("idle")
	return null

func process_physics(delta: float) -> State:
	# parent.velocity.y += gravity * delta
	# parent.move_and_slide()
	if prev_state == "west": 
		parent.animations.play("west-walk") # Left"
	elif prev_state == "east": 
		parent.animations.play("east-walk") # "Right"
	elif prev_state == "forward": 
		parent.animations.play("idle") #"Up"
	elif prev_state == "backward": 
		parent.animations.play("backward-walk") # down
		
	return null
