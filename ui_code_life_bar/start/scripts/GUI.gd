extends MarginContainer

onready var number_label = $Bars/LifeBar/Count/Background/Number
onready var bar = $Bars/LifeBar/TextureProgress
onready var tween = $Tween
var animated_health = 0

func _ready():
	var player_max_health = $"../Characters/Player".max_health
	bar.max_value = player_max_health
	update_health(player_max_health)
	
func _process(delta):
	var rounded_health = round(animated_health)
	number_label.text = str(rounded_health)
	bar.value = animated_health

func _on_Player_health_changed(player_health):
	update_health(player_health)
	
func update_health(health):
	tween.interpolate_property(self, "animated_health", animated_health, health, 0.6, Tween.TRANS_EXPO, Tween.EASE_OUT)
	if not tween.is_active():
		tween.start()

func _on_Player_died():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property(self, "modulate", start_color, end_color, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)