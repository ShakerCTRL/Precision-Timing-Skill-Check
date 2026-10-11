extends Control
@onready var points : Label = $GridContainer/ResultPoints
@onready var miss_count : Label =$GridContainer/MissCOunt
@onready var type_hit : Label =$GridContainer/Label2
@onready var cycles : Label = $"GridContainer/Count Cycles2"

var count_points : float
var count_miss : float
var hit_type : int
var count_cycles : int

func _ready() -> void:
	SingletonSkillCheck.hit_registred.connect(func(_zone , _type , _pts):
		count_point()
	)
	SingletonSkillCheck.hit_registred.connect(func(_zone , _type , _pts):
		type(_zone)
		)
	SingletonSkillCheck.connect("miss",count_misses)
func count_point():
	count_points+=1
	points.text = str(count_points)
	pass
func type( area : AreaHitZone):
	type_hit.text = area.get_type()
	pass
func count_misses():
	count_miss+=1
	miss_count.text = str(count_miss)
	pass
	
