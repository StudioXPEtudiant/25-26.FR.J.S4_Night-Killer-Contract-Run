extends Node2D
class_name MainPlayerScript

@export var moveSpeed : float=300

var newVelocity
var orientationChanged

func physic_process(delta):
	var horizontalAxe = Input.get_axis("P.M_LEFT","P.M_RIGHT")
	var direction = Vector2(horizontalAxe,0)
	if !is_zero_approx(horizontalAxe):
		linear_velocity.x += horizontalAxe * moveSpeed * delta

func getlinearvelocity():
	newVelocity
# Pour la prochaine fois avancer sur le code en s'aidant du code
# de Fluffy Flight et de silica voila voila bonne chance pour la
# semaine prochaine
