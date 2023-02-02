extends Node2D


onready var player = $YSort/Player
onready var startPoint = $YSort/StartingPoint

func _ready():
	player.position = startPoint.position


func _on_Door_changeScene():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
