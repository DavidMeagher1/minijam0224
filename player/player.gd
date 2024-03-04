extends CharacterBody2D
@export var target:Marker2D = null
@export_group("Movement")
@export var move_speed:Vector2 = Vector2(20,0)
var starting_move_speed:Vector2 = move_speed
@export var max_move_speed:Vector2 = Vector2(80,120)
@export var move_speed_increase:Vector2 = Vector2(5,5)
@export var velocity_friction:Vector2 = Vector2(0.99,0.99)

@onready var start_position:Vector2 = position
@onready var actual_target:Vector2 = start_position


var diving:bool = false
var latched:bool = true
var charging:bool = false
var hit_target:bool = false
var t:float = 0

signal dove()
signal latch()

func _physics_process(delta):
	handle_dive(delta)
	move_and_slide()

func handle_dive(delta):
	#var distance = abs(actual_target.y - position.y)
	var direction = (actual_target.y - position.y) / actual_target.y
	
	if Input.is_action_pressed("dive") and !diving:
		charging = true
	
	if Input.is_action_just_released("dive") and !diving:
		diving = true
	elif Input.is_action_just_released("dive") and diving:
		diving = false
		
	
			
	if move_speed.y > max_move_speed.y:
		move_speed.y = max_move_speed.y
			
	velocity.y += direction * move_speed.y
	velocity.y *= velocity_friction.y
