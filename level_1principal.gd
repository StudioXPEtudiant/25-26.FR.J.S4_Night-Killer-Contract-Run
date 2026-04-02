extends Node2D

func _ready():
	if GameState.task_completed:
		$Door.open()
