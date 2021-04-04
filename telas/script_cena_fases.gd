extends Node2D

var faseSelecionada = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	faseSelecionada = ScriptGlobal.faseAtual
	exibir_progressao()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(faseSelecionada == 1 && Input.is_action_just_pressed("ui_right") && ScriptGlobal.faseAtual > 1):
		faseSelecionada += 1	
		$AudioStreamPlayer.play()	
	
	elif(faseSelecionada == 2 && Input.is_action_just_pressed("ui_right") && ScriptGlobal.faseAtual > 2):
		faseSelecionada += 1
		$AudioStreamPlayer.play()
	elif(faseSelecionada == 2 && Input.is_action_just_pressed("ui_left")):
		faseSelecionada -= 1
		$AudioStreamPlayer.play()
	
	elif(faseSelecionada == 3 && Input.is_action_just_pressed("ui_left")):
		faseSelecionada -= 1
		$AudioStreamPlayer.play()
	
	altera_sprite_fase()
	
	if(Input.is_action_just_pressed("ui_confirm")):
		direciona_fase()

func exibir_progressao():
	if(ScriptGlobal.faseAtual == 1):
		$Fase01.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseAtual > 1):
		$Fase01.region_rect = Rect2(1, 1, 51, 25)
		
	if(ScriptGlobal.faseAtual == 2):
		$Fase02.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseAtual > 2):
		$Fase02.region_rect = Rect2(1, 1, 51, 25)
	else:
		$Fase02.region_rect = Rect2(107, 1, 51, 25)
		
	if(ScriptGlobal.faseAtual == 3):
		$Fase03.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseAtual > 3):
		$Fase03.region_rect = Rect2(1, 1, 51, 25)
	else:
		$Fase03.region_rect = Rect2(107, 1, 51, 25)

func altera_sprite_fase():
	if(faseSelecionada == 1):
		$Fase01.region_rect = Rect2(54, 1, 51, 25)
	else:
		$Fase01.region_rect = Rect2(1, 1, 51, 25)
		
	if(faseSelecionada == 2):
		$Fase02.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseAtual < 2):
		$Fase02.region_rect = Rect2(107, 1, 51, 25)
	else:
		$Fase02.region_rect = Rect2(1, 1, 51, 25)
		
	if(faseSelecionada == 3):
		$Fase03.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseAtual < 3):
		$Fase03.region_rect = Rect2(107, 1, 51, 25)
	else:
		$Fase03.region_rect = Rect2(1, 1, 51, 25)

func direciona_fase():
	if(faseSelecionada == 1):
		get_tree().change_scene("res://fases/cena_fase01.tscn")
	elif(faseSelecionada == 2):
		#get_tree().change_scene("res://fases/cena_fase02.tscn")
		print("fase02")
	elif(faseSelecionada == 3):
		#get_tree().change_scene("res://fases/cena_fase03.tscn")
		print("fase03")
