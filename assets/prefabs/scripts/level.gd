
extends Node2D

onready var screen = OS.get_window_size()
onready var player = get_node("player")
onready var shoot_timer = get_node("shoot_timer")
onready var spawn_timer = get_node("spawn_timer")

var bg_scene = preload("res://assets/prefabs/bg.tscn")
var bullet_scene = preload("res://assets/prefabs/bullet.tscn")
var enemy_scene = preload("res://assets/prefabs/enemy.tscn")

var spawn_pos = Vector2(534, - 912)
var bg
var bullet
var shoot
var enemy

func _ready():
	bg = bg_scene.instance()
	bg.set_pos(Vector2(534, - 144))
	add_child(bg)
	set_process(true)

func _process(delta):
	shoot = Input.is_action_pressed("shoot")
	if bg.get_pos().y >= 500:
		bg = bg_scene.instance()
		bg.set_pos(spawn_pos)
		add_child(bg)
	if player.is_out:
		get_tree().reload_current_scene()
	for e in get_tree().get_nodes_in_group("enemies"):
		if e.dead:
			e.get_node("sprite").play("explose")
			get_node("SamplePlayer2D 2").play("explosion")


func _on_shoot_timer_timeout():
	bullet = bullet_scene.instance()
	bullet.set_pos(player.get_node("spawn_pos").get_global_pos())
	bullet.dir.y = -1
	add_child(bullet)
	get_node("SamplePlayer2D").play("weapon")
	#timer.set_active(false)


func _on_spawn_timer_timeout():
	randomize()
	enemy = enemy_scene.instance()
	enemy.set_pos(Vector2(rand_range(0, 1024), -50))
	add_child(enemy)
