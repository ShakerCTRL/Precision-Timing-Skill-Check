class_name AreaHitZone
extends Area2D
@onready var _collision_shape : CollisionShape2D = $CollisionShape2D


enum Sucess{
	ANYWAY = 0,
	GREAT = 1,
	PERFECT = 2
}
## Defines the hit accuracy type for the hitzone.
## [br][br]
## [code]ANYWAY[/code]: Generic hit; accuracy type is irrelevant for the minigame logic.[br]
## [code]GREAT[/code]: Good/average hit accuracy.[br]
## [code]PERFECT[/code]: Perfect hit accuracy within the hitzone target.
@export var _type : Sucess = Sucess.ANYWAY
## Score points used for custom minigame logic or tracking.
@export var point : float = 0

## Returns the string representation of the hit accuracy type
func get_type()-> String:
	var name_type : String = Sucess.keys()[_type]
	return name_type
##Metodo que retorna o tamanho do collision shape, caso seja uma retangulo ou quadrado, para pegar de outra forma existem outros metodos especificos
func get_size_shape():
	return _collision_shape.shape.size
	
func hittable():
	queue_free()
