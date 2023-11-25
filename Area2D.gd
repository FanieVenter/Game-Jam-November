extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func on_area_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
		print("entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
