extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 120 * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
