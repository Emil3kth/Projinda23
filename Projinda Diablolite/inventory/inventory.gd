extends Area2D

@export var hotbar_size = 10

var hotbar = []

func _ready():
	# Initialize the hotbar with empty slots
	for i in range(hotbar_size):
		hotbar.append(null)

func pick_up_item(item):
	# Find an empty slot in the hotbar
	var index = hotbar.find(null)
	if index != -1:
		# Add the item to the hotbar and update the UI
		hotbar[index] = item
		update_hotbar()
	else:
		# TODO: Handle the case where the hotbar is full
		pass

func update_hotbar():
	# TODO: Update the UI to reflect the current hotbar
	pass
