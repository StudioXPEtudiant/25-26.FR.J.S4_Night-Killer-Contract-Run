extends Node2D

var is_open := false

func open():
	if is_open:
		return
	is_open = true
	position.y -= 100
