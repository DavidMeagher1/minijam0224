extends ProgressBar
@onready var player = $"../../../Player"


# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = player.max_move_speed.y
	value = player.move_speed.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = player.move_speed.y
