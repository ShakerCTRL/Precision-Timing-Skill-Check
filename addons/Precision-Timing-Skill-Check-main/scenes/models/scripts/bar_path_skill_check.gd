@tool
class_name BarPathSkillCheck
extends PathSkillCheck
@export var line_width: float = 200.0:
	set(value):
		line_width = value
		build_horizontal_line_path(line_width)
		

func rules_build_path():
	build_horizontal_line_path(line_width)
	
func build_horizontal_line_path(length: float) -> void:
	var new_curve: Curve2D = Curve2D.new()
	var half_length: float = length / 2.0
	
	# Ponto 1: Extremidade Esquerda
	new_curve.add_point(Vector2(-half_length, 0.0))
	
	# Ponto 2: Extremidade Direita
	new_curve.add_point(Vector2(half_length, 0.0))
	
	curve = new_curve
