extends Node2D

export(int) var max_health = 1
onready var health = max_health setget set_health

signal die

func set_health(value):
	health = value
	if health <= 0:
		emit_signal("die")
