extends Node2D

func _ready():
	ScriptGlobal.QuantidadeVida = 3
	ScriptGlobal.QuantidadePontos = 0
	ScriptGlobal.PersonagemMorreu = false

func limpar_objeto(area):
	if(area.name == "spinner"):
		area.queue_free()