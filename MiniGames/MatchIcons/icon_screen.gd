extends Node2D
class_name icon_screen

const show_probability: float = .25
const minimum_icons_shown: int = 2 

var types_shown: Array[match_icons_minigame.icon_type] = []

func _ready() -> void:
	var children: Array[Node] = get_children()
	
	while types_shown.size() < minimum_icons_shown:
		for child: icon in children:
			var visible: bool = randf() < show_probability
			if visible and not child.visible:
				child.set_visible(true)
				types_shown.append(child.type)
