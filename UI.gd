extends CanvasLayer

onready var TweenUI = $TweenUI
onready var HP_bar = find_node("HP")
onready var EXP_bar = find_node("ST")
onready var Lvl_label = find_node("Level")
onready var Name = find_node("Name")

var creature_data setget _on_Creature_update_info

func _ready():
	if !creature_data:
		Lvl_label.text = "0"
		Name.text = "Creature's Name"
	else:
		Lvl_label.text = str(creature_data.lvl)
		Name.text = creature_data.name
	pass

func _on_Creature_HP_change(HP_from, HP_to):
	print(str(HP_from) +" "+ str(HP_to))
	TweenUI.interpolate_property(HP_bar, "value", HP_from, HP_to, 0.3, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	TweenUI.start()


func _on_Creature_update_info(data):
	creature_data = data
