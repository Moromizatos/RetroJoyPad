extends ScrollContainer

onready var Slot = preload("res://Scenes/UI/Slot.tscn")

func _ready():
	for i in range(9):
		var new_slot = Slot.instance()
		new_slot.name = "Slot"+str(i)
		#get_child(2) because ScrollContainer creates _v_scroll and _h_scroll before any other child
		get_child(2).add_child(new_slot)
	var slots = get_child(2).get_children()
	for slot in slots:
		#print(slot.get_index())
		if slot.get_index() -1 == -1:
			slot.focus_neighbour_right = slots[slot.get_index() +1].get_path()
		elif slot.get_index() + 1 > slots.size() -1:
			slot.focus_neighbour_left = slots[slot.get_index() -1].get_path()
		else:
			slot.focus_neighbour_right = slots[slot.get_index() +1].get_path()
			slot.focus_neighbour_left = slots[slot.get_index() -1].get_path()
		slot.set_focus_mode(FOCUS_ALL)
