
extends Sprite

export(float) var speed = 20
export(Vector2) var spawn_pos = Vector2(534, -912)

var velocity = Vector2()


func _ready():
	velocity.x = get_pos().x
	set_process(true)

func _process(delta):
	velocity.y = get_pos().y + (speed * delta)
	set_pos(velocity)

func _on_VisibilityNotifier2D_exit_screen():
	queue_free()
