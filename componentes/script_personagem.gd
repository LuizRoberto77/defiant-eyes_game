extends KinematicBody2D

const ceu = Vector2(0, -1)
const gravidade = 1200
const velocidade = 400
const pulo_altura = -650
var movimentacao = Vector2()
var no_chao
var atacando1
var atacando2

func _ready():
	$Camera2D.limit_bottom = 1280
	$Camera2D.limit_right = 16512

func _physics_process(delta):
	movimentacao.y += gravidade * delta
	
	var animacao = "parado"
	
	movimentacao.x = 0
	var direcao_movimento = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	movimentacao.x = velocidade * direcao_movimento
	
	if direcao_movimento != 0:
		$Sprite.flip_h = false if direcao_movimento > 0 else true
	
	movimentacao = move_and_slide(movimentacao, ceu)
		
	no_chao = is_on_floor()
	
	if is_on_floor() && Input.is_action_just_pressed("ui_up"):
		movimentacao.y = pulo_altura
		
	if Input.is_action_just_pressed("ui_atq_marreta") && !atacando1 &&!atacando2:
		atacando1 = true
		yield(get_tree().create_timer(0.2), "timeout")
		atacando1 = false
		
	if Input.is_action_just_pressed("ui_atq_spinner") && !atacando2 &&!atacando1:
		atacando2 = true
		yield(get_tree().create_timer(0.2), "timeout")
		atacando2 = false
	
	if atacando1:
		animacao = "ataque_marreta"		
	elif atacando2:
		animacao = "ataque_spinner"	
	elif !no_chao:
		animacao = "pulando"
	elif movimentacao.x != 0:
		animacao = "andando"
		
	if $AnimationPlayer.assigned_animation != animacao:
		$AnimationPlayer.play(animacao)
	
#func _process(delta):
#	pass
