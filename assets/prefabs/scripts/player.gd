
extends KinematicBody2D

export(float) var speed = 300
export(float) var acc = 10

var dir = Vector2()
var velocity = Vector2()
var move_left
var move_right
var is_out = false

func _ready():
	dir.y = 0
	set_fixed_process(true)

func _fixed_process(delta):
	move_left = Input.is_action_pressed("move_left")
	move_right = Input.is_action_pressed("move_right")
	dir = Vector2()
	
	
	if move_left and not move_right:
		dir.x = - 1
	elif move_right and not move_left:
		dir.x = 1 
	
	velocity = dir.normalized() * speed * delta
	move(velocity)

func _on_VisibilityNotifier2D_exit_screen():
	is_out = true