extends Control

var selected_left = null
var connection = {
	"RedLeft": "RedRight",
	"BlueLeft": "BlueRight",
}

func _ready():
	$LeftPanel/RedLeft.pressed.connect(func(): select_left("RedLeft"))
	$LeftPanel/BlueLeft.pressed.connect(func(): select_left("BlueLeft"))
	$RightPanel/RedRight.pressed.connect(func(): try_connect("RedRight"))
	$RightPanel/BlueRight.pressed.connect(func(): try_connect("BlueRight"))

func select_left(name):
	selected_left = name
	print("Sélection :", name)

func try_connect(right_name):
	if selected_left == null:
		return
	if connection[selected_left] == right_name:
		print("Bonne connexion :", selected_left, "->", right_name)
		draw_connection(selected_left, right_name)
		connection.erase(selected_left)
		selected_left = null
		if connection.size() == 0:
			task_complete()
	else:
		print("Mauvaise connexion")
		selected_left = null

func draw_connection(left_name, right_name):
	var left_node = get_node("LeftPanel/" + left_name)
	var right_node = get_node("RightPanel/" + right_name)
	
	var left_rect = left_node.get_global_rect()
	var right_rect = right_node.get_global_rect()
	
	var start_global = left_rect.position + left_rect.size / 2
	var end_global = right_rect.position + right_rect.size / 2
	
	var start_pos = $Lines.to_local(start_global)
	var end_pos = $Lines.to_local(end_global)
	
	var color = Color.WHITE
	if "Red" in left_name:
		color = Color.RED
	elif "Blue" in left_name:
		color = Color.BLUE
	$Lines.add_line(start_pos, end_pos, color)

func task_complete():
	$Label.text = "Mission terminée !"
	print("FIN")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Level1.tscn")
