## Skill check component that defines the Path2D trajectory and layout support for hitzones and pointers.
## [br][br]
## Serves as the spatial foundation for path-based minigames, providing path geometry and spatial positioning 
## for pointers and hitzones. 
## [br][br]
## [b]Note:[/b] Extend this class (e.g., [code]CirclePathSkillCheck[/code]) to implement specific path geometries. 
## Overall minigame flow, hit evaluation, and lifecycle logic are managed by the parent [code]SkillCheck[/code].
class_name PathSkillCheck
extends Path2D

#Default scene type used to automatically instantiate a hitzone
@export var base_hit_zone_Object_Scene : PackedScene
## If [code]true[/code], the path is edited manually; if [code]false[/code], it must follow defined rules via rules_build_path().
@export var manual_edition : bool = false
## Array of hitzones associated with this path.
## [b]Important:[/b] Always add your hitzones to this list, even if there is only one.
@export var _current_hit_zones : Array[HitZone]
##Pointer instance assigned to move along this path.
## [b]Important:[/b] Must reference the active pointer node.
##Reference to the pointer loaded during [method _ready].
@export var pointer : Pointer
@export var _texture : Sprite2D
func _ready() -> void:
	if _current_hit_zones.size() <=0:
		add_hit_zones()
	if manual_edition:
		return
	rules_build_path()

##Handles path drawing/building logic and validation[br]
##If empty, the path must be drawn via the Inspector using the inherited Path2D property.
func rules_build_path() -> void:
	pass
## Returns Size Path/the total pre-calculated (baked) length of the path curve.
func get_size_path() -> float:
	return curve.get_baked_length()
## Returns an array containing all currently registered in hitzone
func get_hit_zones()-> Array:
	return _current_hit_zones
## Returns the reference to the pointer node or resource used in the minigame.
func get_pointer():
	return pointer
	
func add_hit_zones( amount : int = 1,object_scene : PackedScene = base_hit_zone_Object_Scene ):
	for new_hitzones in amount:
		var new_instantiate : HitZone = object_scene.instantiate()
		_current_hit_zones.append(new_instantiate)
		new_hit_zones.emit()

signal new_hit_zones
