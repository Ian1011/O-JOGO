extends TextureButton

@export var skill: Skill:
	set (value):
		skill = value
		texture_normal = value.texture
		$LV.text = "Lv " + str(skill.level + 1)
		$Description.text = value.upgrades[value.level].description

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and skill:
		skill.upgrade_skill()
		get_parent().close_option(skill)
