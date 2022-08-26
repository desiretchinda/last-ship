
extends KinematicBody2D

export(float) var speed = 300
export(float) var acc = 10

var dir = Vector2(0, 1)
var velocity = Vector2()
var dead = false
var anim

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	velocity = dir.normalized() * speed * delta
	if get_node("sprite").get_animation() == "explose":
		if get_node("sprite").get_frame() >= 16:
			queue_free()
	move(velocity)

func _on_VisibilityNotifier2D_exit_screen():
	if get_pos().y > get_viewport_rect().size.y:
		get_tree().reload_current_scene()

