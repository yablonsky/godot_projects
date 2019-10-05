extends Area2D

var ball = preload("res://ball.tscn")

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		_on_click(event)
		
func _on_click(event):
	var ball_node = ball.instance()
	ball_node.position = event.position
	add_child(ball_node)