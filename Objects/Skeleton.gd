extends KinematicBody2D


onready var stats = $Stats
const EnemyDeathEffect = preload("res://DeathEffect.tscn")

func _ready():
	print(stats.max_health)
	print(stats.health)

func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	print("damage")

func _on_Stats_die():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.scale.x = 0.2
	enemyDeathEffect.scale.y = 0.2
	enemyDeathEffect.global_position = global_position
