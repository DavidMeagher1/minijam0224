extends State

# Basic state template
@onready var player = $"../../.."
var t:float = 0
var enabled:bool = false

func enter():
	enabled = true

func exit():
	enabled = false
	player.velocity.x = 0
	player.move_speed.x = player.starting_move_speed.x

func update(delta):
	pass

func physics_update(delta):
	t += delta * PI * 2
	player.velocity.x = player.move_speed.x * cos(t)



