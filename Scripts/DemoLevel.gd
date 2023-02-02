extends Node2D

onready var player = $YSort/Player
onready var startPoint = $YSort/StartingPoint
onready var cutscene = $CutScene

func _ready():
	player.position = startPoint.position
	cutscene.play("AutoPath")


func _on_Door_changeScene():
	get_tree().change_scene("res://Scenes/ThirdLevel.tscn")
