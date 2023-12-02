extends State

@export var idle_state: State
var direction = ""

func enter() -> void:
	super()
	# parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	# parent.velocity = move_speed * moveDirection
	return null

func process_physics(delta: float) -> State:
	# parent.velocity.x = move_speed * delta
	# parent.velocity.y = move_speed*delta
	
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * move_speed
	print(moveDirection)
	
	parent.velocity = move_speed * moveDirection
	
	if direction != "":
		prev_state = direction
	
	if parent.velocity.x < 0: 
		direction = "west" # Left"
	elif parent.velocity.x > 0: 
		direction = "east" # "Right"
	elif parent.velocity.y < 0: 
		direction = "backward" #"Up"
	elif parent.velocity.y > 0:
		direction = "forward" # down
	
	if parent.velocity.length() == 0:
		print("priv sate : ", prev_state)
		idle_state.prev_state = prev_state
		return idle_state # idle_state # call idle animation <-- not defined yet
		
	parent.animations.play(direction+'-walk')
	parent.move_and_slide()
	return null

"""
extends State

@export
var idle_state: State

func process_input(event: InputEvent) -> State:
	print("input")
	return null

func enter() -> void:
	print("Run enter")
	return

func process_physics(delta: float) -> State:
	# parent.velocity.y += gravity * delta
	var movement = get_movement_input() * move_speed
	print("in proc phys")
	
	var direction
	if parent.velocity.x < 0: 
		direction = "west" # Left"
	elif parent.velocity.x > 0: 
		direction = "east" # "Right"
	elif parent.velocity.y < 0: 
		direction = "backward" #"Up"
	elif parent.velocity.y > 0:
		direction = "forward" # down
	elif parent.velocity.length() == 0:
		animations.play("west-walk")
		return # idle_state # call idle animation <-- not defined yet
	
	print(direction)
	
	animations.play(direction+"-walk")
	parent.move_and_slide()
	
	return null
"""
