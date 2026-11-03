extends Control

@onready var nome_classe = $"fundo2/box fundo2/nome da classe"
@onready var animação_player = $"fundo2/box fundo2/animação_player"
var play_warrior = "res://cenas/cenas pequenas/Warrior.tscn"
var play_mago = "res://cenas/cenas pequenas/Mago.tscn"
var play_range = "res://cenas/cenas pequenas/Range.tscn"


func _on_classe_warrior_pressed() -> void:
		nome_classe.text  = "uma descrição breve sobre a classe e seus beneficios"
		animação_player.visible = true
		animação_player.play("red_parado")
		Global.Classe = "Warrior"
	


func _on_classe_mago_pressed() -> void:
	nome_classe.text  = "uma descrição breve sobre a classe e seus beneficios"
	animação_player.visible = true
	animação_player.play("blue_parado")


func _on_classe_distancia_pressed() -> void:
	nome_classe.text  = "uma descrição breve sobre a classe e seus beneficios"
	animação_player.visible = true
	animação_player.play("green_parado")


func _on_botão_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/menu_inicial.tscn")
