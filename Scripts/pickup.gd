extends Area2D
class_name Pickup

func _on_body_entered(body):
	if body.has_method("collect"):
		body.collect(100)
		queue_free()
