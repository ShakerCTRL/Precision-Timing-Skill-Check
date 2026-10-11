@tool
class_name CirclePathSkillCheck
extends PathSkillCheck


## Explanation of the radius property setter:
##
## [b]set(value):[/b] Custom setter function triggered whenever 'radius' changes in the Inspector or script.
## [b]radius = value:[/b] Updates the internal variable with the new float value.
## [b]if is_node_ready():[/b] Ensures the node has finished its _ready() setup, preventing null reference errors during scene loading.
## [b]rules_build_path():[/b] Rebuilds the circular path curve dynamically using the updated radius.
@export var radius: float = 150.0:
					set(value):
							radius = value
							if is_node_ready() and !manual_edition:
								rules_build_path()


func rules_build_path() -> void:
	create_circle_path()
	pass
	
## Generates a perfect circular path using Path2D curves.	
func create_circle_path():
	var new_curve = Curve2D.new()
	var points = 4 #4 cardinal points
	var handle_length = radius * 0.5522847498 # Constant for optimal Bézier circle approximation
	
	for i in range(points):
		var angle = i * (PI / 2.0)
		var pos = Vector2(cos(angle), sin(angle)) * radius
		
		#Control vectors (Handles)
		var dir_in = Vector2(sin(angle), -cos(angle)) * handle_length
		var dir_out = -dir_in
		
		new_curve.add_point(pos, dir_in, dir_out)
	
	# Closes the circle by connecting the last point back to the first
	new_curve.add_point(new_curve.get_point_position(0), new_curve.get_point_in(0), new_curve.get_point_out(0))
	curve = new_curve
