extends CanvasLayer
class_name UI

@onready var score_label = %score

var score = 0:
	set(new_score):
		score = new_score
		_update_score_label()
		
func _ready():
	_update_score_label()

func _update_score_label():
	score_label.text = str(score)
	
func on_collected(collectable) -> void:
	if collectable:
		score += 100
