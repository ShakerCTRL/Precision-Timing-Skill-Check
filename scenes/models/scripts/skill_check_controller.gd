class_name SkillCheckController
extends Node

@export var _skill_check : SkillCheck
@export var _scene_skill_check_model : PackedScene

func _ready() -> void:
	SingletonSkillCheck.connect("hit_registred", hit_process)
	SingletonSkillCheck.connect("hit_registred", func(area : AreaHitZone, type : String, point : float):
		get_hit_zones_count())
	SingletonSkillCheck.connect("miss",miss_process)
	SingletonSkillCheck.connect("end",end_process)
	
func play_skill_check():
	if !_skill_check:
		print_debug("Null Skill Check")
		return
	_skill_check._play_or_pause(true)
func pause_skill_check():
	_skill_check._play_or_pause(false)
	
func hit_process(area : AreaHitZone, type : String, point : float):
	pass
func miss_process():
	pass
func end_process():
	pass



func spawn_my_skill_check(_scene_skill_check : PackedScene):
	var new_skill_check : SkillCheck = _scene_skill_check_model.instantiate()
	add_child(new_skill_check)
	_skill_check = new_skill_check
	

func get_hit_zones_count():
	_skill_check.get_hit_zone_count()
	pass
