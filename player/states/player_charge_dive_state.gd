extends AutoTransitionState

# Basic state template
@onready var player = $"../.."

func enter():
	pass

func exit():
	player.charging = false

func update(delta):
	pass

func physics_update(delta):
	player.move_speed.y += player.move_speed_increase.y



