extends Marker2D
@export var move_freq:float = 0.25
@export var move_amp:float = 200
var t:float = 0
var stick:bool = false
@onready var player = $"../Player"
@onready var sprite_2d:Sprite2D = $Sprite2D
@onready var start_position = position
# Called when the node enters the scene tree for the first time.
func _ready():
	player.dove.connect(_on_player_dove)
	player.latch.connect(_on_player_latch)

func _on_player_dove():
	stick = true
	sprite_2d.modulate = Color(1.0,0.0,0.0)

func _on_player_latch():
	stick = false
	sprite_2d.modulate = Color(1.0,1.0,1.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !stick:
		t += (delta * move_freq) * PI * 2
		position.y = start_position.y + cos(t) * move_amp
	position.x = player.position.x
