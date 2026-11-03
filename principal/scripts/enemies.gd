extends Node2D

@onready var spawns_demonic = [{	
	'scene':preload("res://scenes/enemies/imp.tscn"),
	'type':'normal',
	'timer':0.0,
	'interval':0.5,
	'start':0.0,
	'end':10*60
}]

@onready var spawns_undead = [{	
	'scene':"",
	'type':'normal',
	'timer':0.0,
	'interval':1,
	'start':0.0,
	'end':1.5*60
},{
	'scene':"",
	'type':'normal',
	'timer':0.0,
	'interval':2,
	'start':0.5*60,
	'end':5.0*60
}]

@onready var spawns_unknown = [{	
	'scene':"",
	'type':'normal',
	'timer':0.0,
	'interval':1,
	'start':0.0,
	'end':1.5*60
},{
	'scene':"",
	'type':'normal',
	'timer':0.0,
	'interval':2,
	'start':0.5*60,
	'end':5.0*60
}]


@onready var is_boss_fight: bool = false

var game_time: float = 0.0
var distance = 700
var spawns
var node_parent: Node2D
var count = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawns = spawns_demonic
	
	randomize()
	node_parent = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if not is_boss_fight:
		game_time += delta
	
	for spawn in spawns:
			if game_time >= spawn.start and game_time <= spawn.end:
				spawn.timer += delta
				while spawn.timer >= spawn.interval:
							
					var pos = get_random_position(node_parent.Player)
					spawn.timer -= spawn.interval
					var enemy_instance = spawn.scene.instantiate()
					enemy_instance.position = pos
					enemy_instance.player = node_parent.Player
					add_child(enemy_instance)
					count += 1
					print(str(count) + " Enemies spawned")
					
			elif game_time >= spawn.end:
				spawns.erase(spawn)

func get_random_position(player):
	return player.position + distance * Vector2.RIGHT.rotated(randf_range(0, 2 * PI))

func call_boss_fight():
	is_boss_fight = !is_boss_fight
