extends State

# Basic state template
@onready var player = $"../../.."

func enter():
	player.latched = false
	player.actual_target = player.target.position
	player.dove.emit()

func exit():
	player.actual_target = player.start_position

func update(delta):
	pass

func physics_update(delta):
	pass



