class_name State
extends Node2D

@export var animation_name: String # ="west-walkk"
@export var move_speed: float = 9
@export var moveDirection: Vector2
@export var prev_state: String

# @export var animations: AnimatedSprite2D = $littleMan
# var move_component
# var parent: CharacterBody2D

# Hold a reference to the parent so that it can be controlled by the state
var parent: Player

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
