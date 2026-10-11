##Manager responsible for organizing hitzones along the assigned path.
class_name ManagerHitZones
extends Node
## Path node containing the hitzones to be organized.
@export var path : PathSkillCheck
## Minimum distance in pixels between hitzones.
@export var min_distance_in_hit_zones : float = 10.0
func _ready() -> void:
	path.connect("new_hit_zones",update)
	var hit_zones : Array[HitZone] = path.get_hit_zones()
	var size_path : float = path.get_size_path()
	organize_hit_zones(hit_zones,size_path, min_distance_in_hit_zones) 



## Function to organize/space out mark areas along the curve[br]
## Parameters:[br]
## - hit_zones: Array of PathFollow2D nodes that were spawned[br]
##- texture_width: Horizontal size (in pixels) of the Sprite/Texture[br]
## - min_distance: Extra spacing (in pixels) between textures[br]
func organize_hit_zones(hit_zones: Array[HitZone],size_path: float, min_distance: float = 10.0) -> void:
	var total_zones = hit_zones.size()
	if total_zones == 0:
		return
	if  total_zones == 1:
		var hit_zone = hit_zones[0]
		var min_path : float = 0 + (hit_zone.get_width_texture()/2)
		var max_path : float = (size_path - ( hit_zone.get_width_texture()/2))
		hit_zone.progress = randf_range(min_path,max_path)
		return
	var total_length: float = path.get_size_path()
	var texture_width: float = hit_zones[0].get_width_texture()
	# Minimum required distance between the centers of two HitZones
	var required_separation: float = texture_width + min_distance
	# Validate if the path has enough total space
	if (required_separation * total_zones) > total_length:
		push_warning("The path is too short to fit all HitZones with this minimum clearance!")
	var placed_positions: Array[float] = []
	for i in range(total_zones):
		var position_found: bool = false
		
		# Attempts to pick a valid random position within attempt limit
		for attempt in range(min_distance):
			# Pick a progress value keeping margins away from path edges
			var candidate_progress: float = randf_range(texture_width / 2.0, total_length - (texture_width / 2.0))
			var valid: bool = true

			# Check separation against already placed zones
			for pos in placed_positions:
				if abs(candidate_progress - pos) < required_separation:
					valid = false
					break

			if valid:
				placed_positions.append(candidate_progress)
				hit_zones[i].progress = candidate_progress
				position_found = true
				break

		# Fallback if random sampling fails to find free space
		if not position_found:
			push_warning("Could not find a valid random position without overlap for HitZone %d." % i)
			var fallback_progress: float = (i * required_separation) + (texture_width / 2.0)
			hit_zones[i].progress = clampf(fallback_progress, 0.0, total_length)
	
		
func update():
	var hit_zones : Array[HitZone] = path.get_hit_zones()
	var size_path : float = path.get_size_path()
	organize_hit_zones(hit_zones,size_path,min_distance_in_hit_zones)
