
extends RigidBody2D

export(float) var speed = 10000
export(float) var acc = 10

var dir = Vector2()
var velocity = Vector2(0, -1)

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity = dir.normalized() * speed * acc * delta
	set_linear_velocity(velocity)


func _on_VisibilityNotifier2D_exit_screen():
	queue_free()

func _on_bullet_body_enter( body ):
	if body.is_in_group("enemies"):
		body.dead = true
