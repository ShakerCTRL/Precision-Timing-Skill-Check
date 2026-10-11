##Precision MiniGame
class_name SkillCheck
extends Node2D
##Initial attribute to set whether the minigame is playable upon loading
@export var in_play : bool = false
##The minigame's movement path and the hitzone spawn manager.
@export_category("Path")
## Reference to the [PathSkillCheck] node used for path layout and spatial positioning.
@export var path : PathSkillCheck
@export var manager_hit_zones : ManagerHitZones

@export_category("Pointer Values")
## Directly change the pointer settings here according to the database used.[br]
## You can create a dedicated [ResourcePointer] for each specific pointer.
@export var data_pointer : ResourcePointer
##Reference to the pointer loaded during [method _ready].
var _pointer : Pointer

func _ready() -> void:
	#Assign the loaded pointer reference
	_pointer = path.get_pointer()
	#Set whether the minigame starts in an active or paused state
	_play_or_pause(in_play)


func _physics_process(_delta: float) -> void:
	#Core gameplay input check during physics execution
	if Input.is_action_just_pressed("ui_accept"):
		if _pointer.get_hittable():
			var current_hit_zone : AreaHitZone = _pointer._current_hit_zone
			SingletonSkillCheck.hit_registred.emit(current_hit_zone, current_hit_zone.get_type(), current_hit_zone.point)
		else:
			SingletonSkillCheck.miss.emit()

## Pauses or resumes minigame execution.
## Useful for displaying information or UI before starting the gameplay loop.
func _play_or_pause(play : bool):
	if !play:
		set_physics_process(play)
		_pointer.set_physics_process(play)
	else:
		set_physics_process(play)
		_pointer.set_physics_process(play)
	
func get_hit_zone_count():
	if path.get_hit_zones().size() <=0:
		SingletonSkillCheck.end.emit()
