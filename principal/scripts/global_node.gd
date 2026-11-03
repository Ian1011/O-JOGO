extends Node
var Classe: String = "Warrior"
var playerdir
var play : Node2D

func _ready() -> void:	
	pass
	
func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
