@tool
class_name ArcPathSkillCheck
extends PathSkillCheck
## [b]radius = value:[/b] Updates the internal variable with the new float value.
@export var radius: float = 150.0:
					set(value):
							radius = value
							if is_node_ready() and !manual_edition:
								rules_build_path()

func rules_build_path() -> void:
	create_arc()
	
func create_arc():
	var new_curve: Curve2D = Curve2D.new()
	var handle_length: float = radius * 0.5522847
		
	# Ponto 1: Topo
	new_curve.add_point(Vector2(0, -radius), Vector2.ZERO, Vector2(handle_length, 0))
	# Ponto 2: Vértice Curvo (Direita)
	new_curve.add_point(Vector2(radius, 0), Vector2(0, -handle_length), Vector2(0, handle_length))
	# Ponto 3: Base
	new_curve.add_point(Vector2(0, radius), Vector2(handle_length, 0), Vector2.ZERO)
	
	curve = new_curve
