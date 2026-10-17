class_name HitZone
extends PathFollow2D
## Manual texture width reference used for hitzone layout math.
## [br][br]
## Due to variations in shape sizing methods across Godot's API,
## this value simplifies hitzone distribution and placement calculations.
## [br][br]
## [b]Note:[/b] This property is read-only for layout math and does [i]not[/i] resize or scale the actual texture.
@export var _width_texture : float
## Visual sprite texture used as the background for the hitzone target area.
## [br][br]
## Serves as the background when multiple hit regions exist within a single hitzone;
## otherwise, it can be used to reference the main hitzone sprite directly.
@export var _texture : Sprite2D
## Array responsible for storing the HitZone areas. A single HitZone can contain multiple areas with different score values and hit types.
@export var _area_hit_zone : Array[AreaHitZone]


func get_width_texture():
	return _width_texture


func get_hit_area():
	return _area_hit_zone
