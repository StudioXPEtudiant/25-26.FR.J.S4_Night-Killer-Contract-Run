extends Node2D

var line_list = []

func add_line(start_pos, end_pos, color):
	line_list.append({
		"start": start_pos,
		"end": end_pos,
		"color": color
	})
	queue_redraw()

func _draw():
	for line in line_list:
		draw_line(line["start"], line["end"], line["color"], 6.0)
