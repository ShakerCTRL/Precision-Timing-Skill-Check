class_name Pointer
extends PathFollow2D
@export var _area_pointer : Area2D
var speed_pointer : float = 400
## Pointer configuration and attribute data used throughout its lifecycle
@export var data : ResourcePointer
var pointer_direction : float = 1.0
## Determines whether the pointer can hit the current AreaHitZone
var hittable : bool = false
## Stores the reference to the Area2D of the active hitzone that the pointer can currently hit.
var _current_hit_zone : AreaHitZone


func _ready():
	if data.one_shot && data.effect_elastic:
		data.effect_elastic = false
	loop = !data.effect_elastic
	speed_pointer = data.speed
	pointer_direction = data.direction
	_area_pointer.area_entered.connect(_can_hit)
	_area_pointer.area_exited.connect(not_hit)
	
func _physics_process(delta: float) -> void:
	move_pointer(delta)

func move_pointer( delta):
	progress += speed_pointer * pointer_direction * delta

	if loop and data.one_shot:
		if progress_ratio >= 0.9:
			progress_ratio = 1.0
			SingletonSkillCheck.end.emit()
			set_physics_process(false)
		return
	else:
		if progress_ratio >= 1.0:
			progress_ratio = 1.0
			pointer_direction = -1.0     
		elif progress_ratio <= 0.0:
			progress_ratio = 0.0 
			pointer_direction = 1.0      
			
## Determines whether the specified Area2D is a valid hitzone.
func is_hit_zone(area : Area2D) -> bool:
	if area is AreaHitZone:
		return true
	else:
		return false
func _can_hit(area : Area2D):
	var i_can : bool = is_hit_zone(area)
	if !i_can:
		return
	else:
		hittable = true
		_current_hit_zone = area
func not_hit(area : Area2D):
	var i_not : bool = is_hit_zone(area)
	if !i_not:
		return
	else:
		hittable = false
		_current_hit_zone = null
	
func get_speed_pointer():
	return speed_pointer
func get_hittable():
	return hittable
func get_direction():
	return pointer_direction
#func count_cycles():
	#if loop:
		#if progress_ratio>0.9:
			#_has_triggered_lap = false
		#if progress_ratio <0.1 and not _has_triggered_lap:
			#_has_triggered_lap = false
			#lap_count +=1
			#SingletonSkillCheck.cycle_completed.emit(lap_count)
	#else:
		#if progress_ratio >= 1.0:
			#lap_count +=1
			#SingletonSkillCheck.cycle_completed.emit(lap_count)
		#if progress_ratio <=0.0:
			#lap_count +=1
			#SingletonSkillCheck.cycle_completed.emit(lap_count)
		
