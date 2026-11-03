extends CharacterBody2D
class_name Enemy

@export_category("Base")
@export var player = CharacterBody2D
@export var drops: Array[Pickups]
@export var damage: float
@export var health: float
@export var speed: float

var drop = preload("res://scenes/pickups/pickups.tscn")
var damage_popup_node = preload("res://scenes/cenas pequenas/damage.tscn")

var elite: bool = false
var separation: float
var knockback: Vector2

func verify_exclusion():
	separation = (player.position - position).length()

	if separation > 1000 and not elite:
		queue_free()
	
	if separation < player.nearest_enemy_distance:
		player.nearest_enemy = self

func drop_item():
	if drops.size() == 0:
		return
	
	var item = drops.pick_random()
	var item_to_drop = drop.instantiate()
	
	item_to_drop.type = item
	item_to_drop.position = position
	item_to_drop.player = player
	
	get_tree().current_scene.call_deferred("add_child", item_to_drop)

func take_damage(amount):
	health -= amount
	damage_popup(amount)
	if health <= 0:
		drop_item()
		queue_free()
		
func knockback_get():
	knockback = knockback.move_toward(Vector2.ZERO, 1)
	return knockback

func damage_popup(amount):
	var popup = damage_popup_node.instantiate()
	popup.text = str(amount)
	popup.position = position + Vector2(-50, -25)
	get_tree().current_scene.add_child(popup)
	
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(3, 0.25, 0.25), 0.2)
	tween.chain().tween_property($Sprite2D, "modulate", Color(1, 1, 1), 0.2)
	tween.bind_node(self)
