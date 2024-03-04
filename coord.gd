extends Line2D

@export var target:CharacterBody2D
@export var segmants:int = 12
@export var angle:float = 45
@export var line_scale:float = 0.5
var t:float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_new_points() -> Array[Vector2]:
	var distance = global_position.distance_to(target.global_position)
	var direction = global_position.direction_to(target.global_position)
	var ps:Array[Vector2] = [Vector2.ZERO]
	var chunk_size = (distance * line_scale) / segmants
	for i in range(0,segmants):
		var j = i + 1
		var angle_change = Vector2(cos(angle * j + t),sin(angle * j))
		var spiral_point = (direction + angle_change) * chunk_size * j
		ps.append(spiral_point)
	ps.append(distance * direction)
	return ps

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += (delta * PI * 2 ) 
	points = get_new_points()
	
func _physics_process(delta):
	position.x = target.global_position.x
