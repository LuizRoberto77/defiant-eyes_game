extends CanvasLayer

func _ready():
	$Tween.interpolate_property($ColorRect, "progresso", 1.0, 0.0, 2.0, Tween.TRANS_QUINT, Tween.EASE_IN_OUT)
	$Tween.start()
