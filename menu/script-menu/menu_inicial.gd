extends Control


@onready var som_botao: AudioStreamPlayer = $"som botao"


#crinado os botões interativos
func _ready() -> void:
	for _button in get_tree().get_nodes_in_group("button"):
		_button.pressed.connect(on_button_pressed.bind(_button))
		
	
#dando o valor da cena para eles 
func on_button_pressed(_button: Button) -> void:
	match _button.name:
		"but jogar": 
			get_tree().change_scene_to_file("res://principal/main.tscn")
	
		"but classe":
			get_tree().change_scene_to_file("res://scenes/menu/tela_classe.tscn")
			
			
		"but opções":
			som_botao.play()
		
		"but conquista": 
			som_botao.play()
		
		"but sair":
			get_tree().quit()
			
