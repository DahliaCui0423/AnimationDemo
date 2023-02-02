extends Area2D

const HitEffect = preload("res://HitEffect.tscn")

func _on_HurtBox_area_entered(area):
	var hiteffect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(hiteffect)
	hiteffect.scale.x = 0.2
	hiteffect.scale.y = 0.2
	hiteffect.global_position = global_position
