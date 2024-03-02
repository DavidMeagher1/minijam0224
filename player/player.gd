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
var hit_target:bool = false
var t:float = 0

signal dove()
signal latch()

func _physics_process(delta):
	handle_drift(delta)
	handle_dive(delta)
	move_and_slide()

func handle_dive(delta):
	var distance = abs(actual_target.y - position.y)
	var direction = (actual_target.y - position.y) / actual_target.y
	
	if Input.is_action_pressed("dive") and !diving:
		move_speed.y += move_speed_increase.y
	
	if Input.is_action_just_released("dive") and !diving:
		diving = true
		
		
	elif Input.is_action_just_released("dive") and diving:
		diving = false
		
	if !diving and distance < 10 and velocity.y < 10:
		position.y = start_position.y
		velocity.y = 0
		if !latched:
			move_speed.y = starting_move_speed.y
			latched = true
			
			latch.emit()
			
	if move_speed.y > max_move_speed.y:
		move_speed.y = max_move_speed.y
			
	velocity.y += direction * move_speed.y
	velocity.y *= velocity_friction.y
	

func handle_drift(delta):
	
	#if !latched and abs(velocity.x) < starting_move_speed.x *2:
	#	velocity.x = 0
	#	move_speed.x = starting_move_speed.x
	var shift = Input.get_axis("left","right")
	if shift != 0:
		move_speed.x += move_speed_increase.x
	velocity.x += shift * move_speed.x * delta
	velocity.x *= velocity_friction.x
