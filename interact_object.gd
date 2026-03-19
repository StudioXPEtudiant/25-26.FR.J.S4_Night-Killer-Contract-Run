extends Node2D

var player_in_range = false

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("Interact"):
		interact()

func _on_body_entered(body):
	if body.name == "Player_Body":
		player_in_range = true
		print("Le joueur peut interagir")

func _on_body_exited(body):
	if body.name == "Player_body":
		player_in_range = false
		print("Le joueur s'eloigne")

func interact():
	get_tree().change_scene_to_file("res://Level1.1.tscn")
