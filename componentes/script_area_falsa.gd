extends Area2D

#Recarrega a cena atual se o Personagem encostou nesta Area2D
func _personagem_caiu(body):
	if(body.name == "Personagem"):
		get_tree().reload_current_scene()
