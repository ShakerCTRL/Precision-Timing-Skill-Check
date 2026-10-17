##Data resource containing pointer attributes and configuration.
class_name ResourcePointer
extends Resource
@export var speed : float

## [code]1.0[/code]: Moves left-to-right / clockwise.[br]
## [code]-1.0[/code]: Moves right-to-left / counter-clockwise.[br][br]
## [b]Note:[/b] Do not alter this value unless using a circular path or one-shot mode.
@export var direction : int = 1
## Toggles the elastic bounce effect for pointer movement.
## When enabled, path looping is automatically disabled.
## [b]Note:[/b] Must remain disabled on circular paths ([code]CirclePathSkillCheck[/code]).
@export var effect_elastic : bool = false
## When enabled, the minigame ends automatically after the pointer completes a single path traversal.
## [b]Note:[/b] Cannot be used alongside [member effect_elastic].
@export var one_shot : bool
