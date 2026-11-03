extends VBoxContainer

@export var skills: HBoxContainer
@export var skills_passive: HBoxContainer
@export var Particle: GPUParticles2D

@onready 	var OptionSlot = preload("res://scenes/player/option_slot.tscn")
@onready var skills_size: int = skills.get_children().size()
@onready var skills_resources = [preload("res://resources/skills/sword.tres")]
@onready var skills_options: int = 3

func _ready() -> void:
	randomize()
	hide()
	Particle.emitting = false


func get_available_resource_in(skills) -> Array[Skill]:
	var resources: Array[Skill] = []
	for skill in skills.get_children():
		if skill.skill != null:
			resources.append(skill.skill)
	return resources
	
func add_option(skill) -> int:
	if skill.is_upgradable():
		var option_slot = OptionSlot.instantiate()
		option_slot.skill = skill
		add_child(option_slot)
		return 1
	return 0
	
	
func close_option(skill):
	hide()
	Particle.emitting = false
	get_tree().paused = false

func show_options():
	var skill_damage_available = get_available_resource_in(skills)
	var skill_passive_available = get_available_resource_in(skills_passive)
	if skill_damage_available.size() == 0 and skill_passive_available == 0:
		return
	
	for slot in get_children():
		slot.queue_free()
	
	var option_count = 0
	for skill in skill_damage_available:
		if skill.is_upgradable():
			option_count += add_option(skill)
	
	for skill in skill_passive_available:
		if skill.is_upgradable():
			option_count += add_option(skill)
	
	if option_count == 0:
		return
	
	var previous_skill
		
	show()
	Particle.emitting = true
	get_tree().paused = true
