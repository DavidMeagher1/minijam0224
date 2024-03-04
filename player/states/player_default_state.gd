extends AutoTransitionState

# Basic state template
@onready var player = $"../.."

func enter():
	pass

func exit():
	pass

func update(delta):
	pass

func physics_update(delta):
	var distance = abs(player.actual_target.y - player.position.y)
	if distance < 5:
		player.position.y = player.actual_target.y
		player.velocity.y = 0
		if !player.latched:
			player.move_speed.y = player.starting_move_speed.y
			player.latched = true
			player.latch.emit()
	handle_drift(delta)
func handle_drift(delta):
	#if !latched and abs(velocity.x) < starting_move_speed.x *2:
	#	velocity.x = 0
	#	move_speed.x = starting_move_speed.x
	var shift = Input.get_axis("left","right")
	if shift != 0:
		player.move_speed.x += player.move_speed_increase.x
	player.velocity.x += shift * player.move_speed.x * delta
	player.velocity.x *= player.velocity_friction.x

