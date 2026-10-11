## Singleton responsible for managing and emitting signals throughout the minigame execution.
extends Node
## Emitted when a hit is registered, providing the hit area, accuracy type, and point value awarded.
signal hit_registred(area : AreaHitZone, type : String, point : float)
## Emitted when a hit action is performed but fails to target any active area.
signal miss
## Emitted when the minigame finishes execution.
signal end()
