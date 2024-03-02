extends Marker2D
@export var move_freq:float = 0.25
@export var move_amp:float = 200
var t:float = 0
var stick:bool = false
@onready var player = $"../Player"
@onready var start_position = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !stick:
		t += (delta * move_freq) * PI * 2
		position.y = start_position.y + cos(t) * move_amp
	position.x = player.position.x
