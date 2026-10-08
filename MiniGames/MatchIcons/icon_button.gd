extends Button
class_name icon_button

@export var type: match_icons_minigame.icon_type = match_icons_minigame.icon_type.NONE

func _ready() -> void:
	assert(type != null and type != match_icons_minigame.icon_type.NONE, "Icon button not assigned a type")
