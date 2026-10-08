extends Sprite2D
class_name icon

@export var type: match_icons_minigame.icon_type = match_icons_minigame.icon_type.NONE

func _ready() -> void:
	assert(type != match_icons_minigame.icon_type.NONE and self.texture != null, "No texture or icon type were assigned")
